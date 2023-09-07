# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

Like.destroy_all
Comment.destroy_all
Post.destroy_all
User.destroy_all

quantity_users = 10
quantity_posts = 10
quantity_comments = 10
quantity_likes = 20
users = []

for user_position in 1..quantity_users do
  temp_user = User.create!(
    name: "User Number #{user_position}",
    photo: Faker::Avatar.image,
    bio: Faker::Lorem.sentences(number: 12 + Random.rand(20)).join(' '),
    post_counter: 0,
    email: "email#{user_position}@email.com",
    password: "abcdef"
  )
  # temp_user.skip_confirmation!
  # temp_user.save!
  users << temp_user
end

for user_position in 0..(quantity_users - 1) do
  for post_position in 0..Random.rand(quantity_posts) do
    temp_post = Post.create!(
      author: users[user_position],
      title: "Post ##{post_position + 1}",
      text: Faker::Lorem.sentences(number: 40 + Random.rand(100)).join(' '),
      likes_counter:0,
      comments_counter: 0
    )
    for comment_position in 0..Random.rand(quantity_comments) do
      position = Random.rand(quantity_users)
      Comment.create!(post: temp_post, author: users[Random.rand(quantity_users)], text: Faker::Lorem.sentences(number: 12 + Random.rand(20)).join(' '))
    end
    for like in 1..Random.rand(quantity_likes) do
      Like.create!(post: temp_post, author: users[Random.rand(quantity_users)])
    end
  end
end

puts "Created #{User.count} users"
puts "Created #{Post.count} posts"
puts "Created #{Comment.count} comments"
puts "Assigned #{Like.count} likes, randomly"