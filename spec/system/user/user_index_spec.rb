require 'rails_helper'

RSpec.describe 'UserIndices', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'user index page' do
    before do
      @user1, @user2, @user3 = User.create([
                                             {
                                               name: 'Charles',
                                               photo: 'photo',
                                               bio: 'Full Stack Web Developer',
                                               post_counter: 0
                                             },
                                             {
                                               name: 'Andrews',
                                               photo: 'photo',
                                               bio: 'Front End Web Developer',
                                               post_counter: 0
                                             },
                                             {
                                               name: 'Forloop',
                                               photo: 'photo',
                                               bio: 'Back End Web Developer',
                                               post_counter: 0
                                             }
                                           ])

      @user1.posts.create(text: 'This is the first user post', title: 'First post', likes_counter: 0,
                          comments_counter: 0)
    end

    it 'shows the users names' do
      visit '/users'
      expect(page).to have_content('Charles')
      expect(page).to have_content('Andrews')
      expect(page).to have_content('Forloop')
    end

    it 'I can see the profile picture for each user.' do
      visit '/users'
      expect(page).to have_content('photo')
    end

    it 'I can see the number of posts each user has written.' do
      visit '/users'
      expect(page).to have_content('Number of Posts: 1')
    end

    it "When I click on a user, I am redirected to that user's show page." do
      visit '/users'
      click_link('link-to-Charles', match: :first)
      expect(page).to have_content('Bio')
    end
  end
end
