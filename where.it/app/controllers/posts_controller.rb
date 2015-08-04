class PostsController < ApplicationController
  def index
    @posts = Post.all

    if search_term
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.all.order('created_at DESC')
    end
  end

  def search_term
    @search_term = params[:search]
    Post.where("title LIKE '%?%'", @search_term)
  end

  def show
    @user = current_user
    @post = Post.find(params[:id]) ## finding the post id
    @comments = @post.comments
    @comment = Comment.new ## Finding my comment id
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create!(post_params)
    @post.user = current_user
    @post.save
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
      params.require(:post).permit(:title, :brand_name, :retailer, :price, :size, :description, :photo_url)
    end

end
