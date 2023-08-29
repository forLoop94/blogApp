class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:id])
    render 'index'
  end

  def show; end
end
