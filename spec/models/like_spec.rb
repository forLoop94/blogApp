require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Forloop', photo: 'myphoto', bio: 'My bio', post_counter: 0) }
  let(:post) do
    Post.new(title: 'The importance of test', text: 'the content', author: user, likes_counter: 0, comments_counter: 0)
  end

  it 'Should update the likes_count in post' do
    Like.create(post:, author: user)
    expect(post.likes.count).to eq(1)
  end
end
