class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update, :destroy]
  before_action :require_same_user, only: [:show ]
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

  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:warning] = 'You do not allowed to access others data'
      redirect_to root_path
    end
  end

end