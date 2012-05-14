# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  user_name              :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :authentication_keys => [ :login]
        

  # Setup accessible (or protected) attributes for your model
  attr_accessor :login
  #has_secure_password
  
  attr_accessible :email, :user_name, :password, 
    :name, :password_confirmation, :remember_me, :login
  
  validates :name, presence: true, length: { maximum: 50}
  
  validates :user_name, presence: true, length:{ within:3..30},
    uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
    format: { with:VALID_EMAIL_REGEX},
    uniqueness: { case_sensitive: false}
  before_save { |u| u.email = email.downcase}
  # attr_accessible :title, :body
  # def
  #******************MICROPOSTS*****************************
  #========================================================
  has_many :microposts, dependent: :destroy

  #==============END OF MICROPOSTS
  #***********************Relationship****************
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  
  #***************************************************
  def self.find_first_by_auth_conditions( warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete( :login)
      where( conditions).where( 
      [ "lower( user_name) = :value or lower( email) = :value",
        { :value => login.downcase}]).first
    else
      where( conditions).first
    end
  end
  def feed
    Micropost.where( "user_id = ?", id)
  end
end
