class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show, :destroy, :update]
  before_action :require_user , except: [:index, :show]
  before_action :require_same_user , except: [:index, :show, :new, :create, :update]


 def index
   @posts = Post.paginate(page: params[:page], per_page: 2).order('id DESC')
 end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    #render plain: params[:post].pretty_inspect
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = "Your post has been created"
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post is getting updated"
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def show
  end

 def destroy
   flash[:danger] = "Post has been deleted"
   @post.destroy
   redirect_to posts_path
 end

  private
 def set_post
   @post = Post.find(params[:id])
 end
  def post_params
    params.require(:post).permit(:title, :body)
  end
  def require_same_user
    if current_user != @post.user and !current_user.admin?
      flash[:warning] = "You don't have access to this page"
      redirect_to root_path
    end
  end


end