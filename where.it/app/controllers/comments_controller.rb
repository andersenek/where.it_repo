class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @user = current_user
    @comment = Comment.find(params[:id]) ## Finding my comment id
    @show_user = @comment[:user_id]
    @post = Post.find(params[:post_id]) ## Finding my post id
  end

  def new ## this needs to render the post id (from the route) and that a comment is going to be new
    @user = current_user
    @post = Post.find(params[:post_id]) ##
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id]) # Finding the post id
    @comment = @post.comments.create!(comment_params)
    redirect_to post_path(@post)
  end

  def edit ### this is going to need the post id and the comment id, (the form should be pre filled in)
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @user = current_user
  end

  def update
    @post = Post.find(params[:post_id])
    @user = current_user
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)

    redirect_to post_comment_path(@post, @comment)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:subject, :comment, :post_id, :user_id)
  end
end
