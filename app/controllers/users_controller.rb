class UsersController < ApplicationController
  def index
    @users = User.all
    render 'index'
  end

  def show
    @user = User.find(params[:id])
    @recent_posts = @user.recent_posts
    render 'show'
  end
end