require 'spec_helper'

describe UsersController do
  subject { page}
  describe "sign up" do
    before { visit signup_path}
    it { should have_selector( 'h2', text: 'Sign up')}
    it { should have_selector( 'title', text: 'Sign up')}
  end
  describe "Profile page" do
    let (:user){ FactoryGirl.create(:user)}
    before{ visit profile_path(user)}
    it{ should have_selector( 'h1', text: user.user_name)}
    it{ should have_selector( 'title', text: user.user_name)}
  end

end
