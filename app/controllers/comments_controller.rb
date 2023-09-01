class CommentsController < ApplicationController
  def new
   @post = Post.find(params[:post_id])
   @user = User.find(params[:user_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @comment = Comment.new(
      author_id: @user.id,
      post_id: @post.id,
      text: params[:text]
    )
    if @comment.save
      redirect_to user_post_path(@user, @post), notice: "Comment succesfully created"
    else
      render 'new'
    end
  end
end