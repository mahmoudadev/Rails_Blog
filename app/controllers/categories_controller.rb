class CategoriesController < ApplicationController
  before_action :set_category
  before_action :require_admin, only: [:new, :edit]



  def index
    @categories = Category.paginate(page: params[:page], per_page: 8)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category has been created'
      redirect_to categories_path
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

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def require_admin
    if !logged_in? || (logged_in? && !current_user.admin?)
      flash[:danger] = "You are not permited to this action"
      redirect_to root_path
    end
  end

end