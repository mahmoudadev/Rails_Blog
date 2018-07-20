class PostsController < ApplicationController

 def index
   @posts = Post.all
 end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    #render plain: params[:post].pretty_inspect
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Your post has been created"
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post is getting updated"
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end


end