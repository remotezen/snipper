require 'spec_helper'
describe User do
 before { @user = User.new( name:"Fred Hudson",
                          email: "remotezen@bell.net",
                          user_name: "grit",
                          password: "vgn-fs550",
                          password_confirmation: 'vgn-fs550'
                          )} 
  subject{ @user}
  it { should respond_to( :name)}
  it { should respond_to( :email)}
  it { should respond_to( :user_name)}
  it{ should respond_to( :microposts)}
  it{ should respond_to( :feed)}
  
  describe "when name is not present" do
    before{ @user.name = " "}
    it { should_not be_valid}
  end
  describe "when email is not present" do
    before{ @user.email = " "}
    it { should_not be_valid}
  end
  describe "when a name is too long" do
    long_name = "m" * 51
    before{ @user.name = long_name}
    it{ should_not be_valid}
 end
  describe "when an email format is invalid" do
    it "should be valid" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |i|
      @user.email = i
      @user.should_not be_valid
    end
  end
 end
  describe "when an email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    it{ should_not be_valid}
    it{ should respond_to( :microposts)}

 end
  describe  "micropost associations" do
    before{@user.save }
    let!(:older_micropost) do
      FactoryGirl.create(:micropost, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_micropost) do
      FactoryGirl.create( :micropost, user: @user, created_at: 1.hour.ago)
    end
    it "should have the right microposts in the right order" do
      @user.microposts.should == [ newer_micropost, older_micropost]
    end
    it "should destroy associated microposts" do
      microposts = @user.microposts
      @user.destroy
      microposts.each do |m|
        Micropost.find_by_id( m.id).should be_nil
      end
    end
    describe "status" do
      let( :auth){ auth_user}
      let( :unfollowed_post) do

        FactoryGirl.create( :micropost, user: auth)
      end
      its( :feed){ should include( newer_micropost)}
      its( :feed){ should include( older_micropost)}
      its( :feed){ should_not include(unfollowed_post )}
    end
  end
end
