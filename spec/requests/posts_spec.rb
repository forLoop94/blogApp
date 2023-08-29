require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index and /show' do
    it 'Should get all posts by user with id of 7' do
      get '/users/7/posts'
      expect(response).to have_rendered('index')
      expect(response.body).to include 'Pagination'
      expect(response).to have_http_status(:success)
    end
    it 'Should get the post with id of 1 by user with id of 7' do
      get '/users/7/posts/1'
      expect(response).to have_rendered('show')
      expect(response.body).to include 'Post #1 by username'
      expect(response).to have_http_status(:success)
    end
  end
end