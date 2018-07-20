class PostsController < ApplicationController
      def new
        @post = Post.new
      end

  def create
    #render plain: params[:post].pretty_inspect
    @post = Post.new(post_params)
    @post.save
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end


end