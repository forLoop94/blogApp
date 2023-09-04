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

    @posts[0].comments.create(text: "first comment", author_id: @user_2.id)
    end

    it 'I can see the profile picture for each user.' do
      visit '/users'
      expect(page).to have_content("photo")
    end

    it "I can see the user's username." do
      visit user_posts_path(@user_1)
      expect(page).to have_content("Charles")
    end

    it "I can see the number of posts the user has written." do
      visit user_posts_path(@user_1)
      expect(page).to have_content("Number of post: 4")
    end

    it "I can see a post's title." do
      visit user_posts_path(@user_1)
      expect(page).to have_content("First post")
    end

    it "I can see some of the post's body." do
      visit user_posts_path(@user_1)
      expect(page).to have_content("My fourth post")
    end

    it "I can see the first comments on a post." do
      visit user_posts_path(@user_1)
      expect(page).to have_content("first comment")
    end

    it "I can see how many comments and likes a post has." do
      visit user_posts_path(@user_1)
      expect(page).to have_content("Comments: 1 | Likes: 0")
    end

    it "When I click on a post, it redirects me to that post's show page." do
      visit user_posts_path(@user_1)
      click_link("#{@posts[0].title}")
      expect(page).to have_button("Like")
    end
  end
end