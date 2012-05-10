namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Fred Hudson",
                 email: "remotezen@bell.net",
                 user_name: "grit",
                 password: "vgn-fs550",
                 password_confirmation: "vgn-fs550")
    99.times do |n|
      name  = Faker::Name.name
      username = Faker::Internet.user_name
      email = Faker::Internet.email 
      password  = "password"
      User.create!(name: name,
                   user_name: "#{username }-#{n}",
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all
    50.times do
      content = Faker::Lorem.sentence(25)
      users.each{ |u| u.microposts.create!( content: content)}
    end
  end
end
