require 'spec_helper'
describe User do
 before { @user = User.new( name:"Fred Hudson",
                          email: "remotezen@bell.net",
                          user_name: "grit"
                          )} 
  subject{ @user}
  it { should respond_to( :name)}
  it { should respond_to( :email)}
  it { should respond_to( :user_name)}
  
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

 end
end
