Factory.sequence :email do |n|
  "test#{n}@example.com"
end
Factory.sequence :user_name do |n|
  "#{n}---grit"
end
FactoryGirl.define do
  factory :user do
    name "Fred Hudson"
    user_name "unit_of_grit"
    email "remotespent@bell.net"
    password "vgn-fs550"
    password_confirmation "vgn-fs550"
  end
  factory :micropost do
    content "Lorem ipsum"
    user
  end
end
