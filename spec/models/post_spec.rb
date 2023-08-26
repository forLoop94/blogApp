require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.new(name: 'Nouridine', photo: 'myphoto', bio: 'This is my bio', post_counter: 0) }
  let(:post) { Post.new(title: 'All posts come here', text: 'the text', author: user) }

  it 'Title must not be blank.' do
    post.title = ''
    expect(post).not_to be_valid
  end
  it 'Title must not exceed 250 characters.' do
    post.title = "Latest August of this year I started to learn Rails. I was following the book Ruby on Rails Tutorial from Learn Enough To Be Dangerous website which uses Minitest to test their application. Truth is: I was not understanding a single line of code about those tests. So I decided to skip them and try to write it using RSpec because the syntax is way more similar to human language than others. But you may be wondering:"
    expect(post).not_to be_valid
  end
  it 'CommentsCounter must be an integer greater than or equal to zero.' do
    post.comments_counter = -1
    expect(post).not_to be_valid
  end
  it 'LikesCounter must be an integer greater than or equal to zero.' do
    post.likes_counter = -1
    expect(post).not_to be_valid
  end

  it 'should return the last 5 comments of the given author ' do
    6.times { |num| Comment.create(post: post, author: user, text: "comment, No:#{num + 1}!") }

    expect(post.recent_comments.length).to eq(5)
    expect(post.recent_comments[-1].text).to eq('comment, No:5!')
  end
end