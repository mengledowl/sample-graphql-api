# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  10.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name

    user = User.create(
      first_name: first_name,
      last_name: last_name,
      email: Faker::Internet.email([first_name, last_name].join(' ')),
      bio: Faker::Lorem.paragraph,
      admin: [true, false].sample
    )

    3.times do
      Post.create(body: Faker::Yoda.quote, user: user)
    end
  end

  users = User.all
  posts = Post.all

  posts.each do |post|
    (0..3).to_a.sample.times do
      Comment.create(
        body: Faker::PrincessBride.quote,
        user: users.sample,
        post: post
      )
    end

    users.sample((0..3).to_a.sample).each do |user|
      Like.create(post: post, user: user)
    end
  end
end
