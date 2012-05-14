require 'spec_helper'

describe Relationship do
  let( :follower){ FactoryGirl.create( :user) }
  let( :followed){ FactoryGirl.create( :user, email: "remotefred@bell.net", user_name:"dread") }
  let( :relationship) do
    follower.relationships.build( followed_id: followed.id)
  end
  subject { relationship}
  it { should be_valid }
  describe "accessible attributes" do
    it "should not allow access to follower_id" do
      expect do
        Relationship.new( follower_id: follower.id)
      
      end.should raise_error( ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
