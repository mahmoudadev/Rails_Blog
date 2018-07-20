class PostsController < ApplicationController
      def new
        @post = Post.new
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

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end


end