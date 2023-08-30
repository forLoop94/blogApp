class UsersController < ApplicationController
  def index
    @users = User.all
    render 'index'
  end

  def show
    @user = User.find_by(id: 7)
    @posts = @user.posts
    render 'show'
  end
end
