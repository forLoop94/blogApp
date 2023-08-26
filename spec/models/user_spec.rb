require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Foorloop', photo: 'Pixels/photos/forloop.png', bio: 'My bio', post_counter: 0) }
  it 'Name has a value' do
    expect(user).to be_valid
  end
  it 'Name must not be blank.' do
    user.name = ''
    expect(user).not_to be_valid
  end
  it 'posts_count should not be negative' do
    user.post_counter = -1
    expect(user).not_to be_valid
  end
  it 'posts_count should be an integer' do
    user.post_counter = 'nothing'
    expect(user).not_to be_valid
  end

  it 'should return the last 3 posts (if any) for a given user' do
    4.times { |num| Post.create(author: user, title: 'Hello', text: "This is post No: #{num + 1}") }

    expect(user.recent_posts.length).to eq 3
    expect(user.recent_posts[-1].text).to eq('This is post No: 3')
  end
end
