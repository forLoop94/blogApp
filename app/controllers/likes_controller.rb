class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = Like.create(
      author_id: @user.id,
      post_id: @post.id
    )
  end
end