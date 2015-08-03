class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @user = current_user
    @post = Post.find(params[:id]) ## finding the post id
    @comments = Comment.where(:post_id => @post)
    @comment = Comment.new ## Finding my comment id
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create!(post_params)
    redirect_to post_path(@post) # Knows to get the id of this post
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private # Anything defined under private is not a CRUD action and is just a helper to use in instances.
    def post_params
      params.require(:post).permit(:title, :content, :photo_url)
    end

end
