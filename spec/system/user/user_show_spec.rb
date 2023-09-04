require 'rails_helper'

RSpec.describe "UserShows", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'User Show page' do
    before do
      @user_1, @user_2, @user_3 = User.create([
        {
        name: 'Charles',
        photo: 'photo',
        bio: 'Full Stack Web Developer',
        post_counter: 0
      },
        {
        name: 'Uwem',
        photo: 'photo',
        bio: 'Front End Web Developer',
        post_counter: 0
      },
        {
        name: 'Andrews',
        photo: 'photo',
        bio: 'Back End Web Developer',
        post_counter: 0
      }
      ])

      @posts = @user_1.posts.create([
        {
          text: "My first post",
          title: "First post",
          likes_counter: 0,
          comments_counter: 0
        },
        {
          text: "My second post",
          title: "second post",
          likes_counter: 0,
          comments_counter: 0
        },
        {
          text: "My third post",
          title: "third post",
          likes_counter: 0,
          comments_counter: 0
        },
        {
          text: "My fourth post",
          title: "fourth post",
          likes_counter: 0,
          comments_counter: 0
        },
      ])
    end

    it 'I can see the profile picture for each user.' do
      visit '/users'
      expect(page).to have_content("photo")
    end

    it "I can see the user's username." do
      visit user_path(@user_1)
      expect(page).to have_content("Charles")
    end

    it "I can see the number of posts the user has written." do
      visit user_path(@user_1)
      expect(page).to have_content("Number of Posts: 4")
    end

    it "I can see the user's bio." do
      visit user_path(@user_1)
      expect(page).to have_content("Full Stack Web Developer")
    end

    it "I can see a button that lets me view all of a user's posts." do
      visit user_path(@user_1)
      page.should have_button('See all posts')
    end

    it "When I click to see all posts, it redirects me to the user's post's index page" do
      visit user_path(@user_1)
      click_button("See all posts")
      expect(page).to have_content("My first post")
      expect(page).to have_content("My second post")
      expect(page).to have_content("My third post")
      expect(page).to have_content("My fourth post")
    end
  end
end