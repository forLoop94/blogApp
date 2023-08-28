require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.new(name: 'Forloop', photo: 'myphoto', bio: 'See my bio here', post_counter: 0) }
  let(:post) do
    Post.new(title: 'The importance of test', text: 'the content', author: user, likes_counter: 0, comments_counter: 0)
  end

  it 'Should update the likes_count in post' do
    Comment.create(post:, author: user, text: 'The text')
    expect(post.comments.count).to eq(1)
  end
end

# RSpec.describe Comment, type: :model do
#   before :each do
#     @author = User.new(name: 'Paul', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Life goes on.')
#     @post = Post.new(author: @author, title: 'My 1st blog', text: 'This is my first blog post')
#     @comment = Comment.create(post: @post, author: @author, text: 'Hi Tom!')
#   end

#   describe '[ Association ]' do
#     it { should belong_to(:post).class_name('Post').with_foreign_key('post_id') }
#     it { should belong_to(:author).class_name('User').with_foreign_key('author_id') }
#   end

#   describe '# -> update_comments_count' do
#     it 'should increment the amount of comments' do
#       @comment.update_comments_count
#       expect(@post.comments_counter).to eq 2
#     end
#   end
# end

# class Sample
#   attr_accessor :title, :author
#   def initialize(title, author)
#     @title = title
#     @author = author
#   end

#   def dis_title
#     @title
#   end

#   def dis_author
#     @author
#   end
# end

# describe Sample do
#   before :each do
#     @sample = Sample.new('Sam', 'fear')
#   end

#   it "should return Sam" do
#     expect(@sample.dis_title).to eq 'Sa'
#   end
# end
