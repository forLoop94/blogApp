class UsersController < ApplicationController
  def index
    @users = User.all
    render 'index'
  end

  def show
    render 'show'
  end
end
