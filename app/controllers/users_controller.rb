class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Congrats!, you has been signed up successfully'
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  def show
    @user = User.find(params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end