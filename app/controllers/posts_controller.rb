class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    user = Post.includes(post: [:comments]).find(params[:user_id])
    render 'index'
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    render 'show'
  end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.new(
      title: params[:title],
      text: params[:text],
      author_id: @user.id
    )
    return unless @post.save

    redirect_to user_posts_path(@user), notice: 'new post created succesfully'
  end
end
