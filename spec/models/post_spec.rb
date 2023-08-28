require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.new(name: 'Forloop', photo: 'myphoto', bio: 'This is my bio', post_counter: 0) }
  let(:post) { Post.new(title: 'All posts come here', text: 'the text', author: user) }

  it 'Title must not be blank.' do
    post.title = ''
    expect(post).not_to be_valid
  end
  it 'Title must not exceed 250 characters.' do
    post.title = 'a' * 255
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
    6.times { |num| Comment.create(post:, author: user, text: "comment, No:#{num + 1}!") }

    expect(post.recent_comments.length).to eq(5)
    expect(post.recent_comments[-1].text).to eq('comment, No:5!')
  end
end
