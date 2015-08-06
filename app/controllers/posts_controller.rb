class PostsController < ApplicationController
  def index
    @posts = Post.all

    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.all.order('created_at DESC')
    end

    @favorites = current_user.favorites

  end

  def show
    @user = current_user
    @post = Post.find(params[:id]) ## Finding the post id
    @comments = @post.comments
    @comment = Comment.new ## Finding my comment id
    @is_favorite = Post.get_favorite(params[:id]) # calling class method get_favorite
    # @is_favorite = @post.favorite_posts.where(post_id: params[:post_id])
    #where current user id matches user id on favorite posts
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

    if @post.user_id == current_user.id # A post can only be edited by user who created the post
      @post.update(post_params)
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.user_id == current_user.id # A post can only be deleted by user who created the post
      @post.destroy
      redirect_to posts_path(:request_type => 'all')
    else
      redirect_to post_path(@post)
    end
  end

  def favorite
    type = params[:type] # See posts/show
    @post = Post.find(params[:id])
    if type == "favorite" # If user selects 'favorite' on post
      current_user.favorites << @post
      redirect_to :back, notice: "You favorited #{@post.title}"

    elsif type == "unfavorite" # Else user selects 'unfavorite' on post
      current_user.favorites.delete(@post)
      redirect_to :back, notice: "Unfavorited #{@post.title}"

    else # Type missing, nothing happens
      redirect_to :back, notice: "Nothing happened."
    end
  end


  private # Anything defined under private is not a CRUD action and is just a helper to use in instances.
    def post_params
      params.require(:post).permit(:title, :brand_name, :retailer, :price, :size, :description, :photo_url)
    end

end
