require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index and /show' do

    let(:person) do
      User.new(
        name: 'Charles',
        photo: 'photo',
        bio: 'Full Stack Web Developer',
        post_counter: 0
      )
    end

    let(:first_post) do
      Post.create(
        author: person,
        title: 'Initial post',
        text: 'Microverse Experience',
        likes_counter: 0,
        comments_counter: 0
      )
    end

    before do
      person.save!
      first_post
    end

    it 'Should get all posts by user with id of 7' do
      get "/users/#{person.id}/posts"
      expect(response).to have_rendered('index')
      expect(response.body).to include 'Pagination'
      expect(response).to have_http_status(:success)
    end
    it 'Should get the post with a specific id by user with a specific id' do
      get "/users/#{person.id}/posts/#{first_post.id}"
      expect(response).to have_rendered('show')
      expect(response.body).to include 'post by Charles'
      expect(response).to have_http_status(:success)
    end
  end
end
