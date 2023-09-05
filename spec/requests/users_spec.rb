require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index and /show' do
    let(:person) do
      User.new(
        name: 'Charles',
        photo: 'photo',
        bio: 'Full Stack Web Developer',
        post_counter: 0
      )
    end

    before do
      person.save!
    end

    it 'Should get users list page' do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(response.body).to include 'Charles'
      expect(response).to render_template('index')
    end
    it 'Should get details of the user with id of 7' do
      get "/users/#{person.id}"
      expect(response).to have_http_status(:success)
      expect(response.body).to include 'See all posts'
      expect(response).to render_template('show')
    end
  end
end
