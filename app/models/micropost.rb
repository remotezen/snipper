class Micropost < ActiveRecord::Base
  attr_accessible :content
  validates :user_id, presence: true
  belongs_to :user
  default_scope order: "microposts.created_at DESC"
  validates :content, presence: true, length: { maximum:  1024}
  scope :from_users_followed_by, lambda{ |u| followed_by( u)}
  def self.followed_by( user)
    followed_user_ids = %( SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id)
                        where( "user_id IN ( #{ followed_user_ids}) OR user_id = :user_id",
                              { user_id: user}
                             )
  end
end
