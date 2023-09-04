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

    it "I can see the post's title." do
      visit user_post_path(@user_1, @posts[0])
      expect(page).to have_content("First post")
    end

    it "I can see who wrote the post." do
      visit user_post_path(@user_1, @posts[0])
      expect(page).to have_content("#{@posts[0].title} by #{@user_1.name}")
    end

    it "I can see how many comments and likes it has." do
      visit user_post_path(@user_1, @posts[0])
      expect(page).to have_content("Comments: 1 | Likes: 0")
    end

    it "I can see the post's body." do
      visit user_post_path(@user_1, @posts[0])
      expect(page).to have_content("My first post")
    end

    it "I can see the username of each commentor." do
      visit user_post_path(@user_1, @posts[0])
      expect(page).to have_content("#{@user_2.name}: #{@posts[0].comments[0].text}")
    end
  end
end