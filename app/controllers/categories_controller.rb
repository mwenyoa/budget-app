class CategoriesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @category = Category.order(created_at: :desc).limit(4)
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @user = current_user
    @category = @user.categories.new(category_params)
    if @category.save
      flash[:notice] = 'Budget category successfully created!'
      redirect_to user_categories_path(current_user)
    else
      flash[:alert] = 'Category could not be created!'
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice] = 'Category Successfully Deleted!'
    else
      flash[:alert] = 'Error prevented the category from being deleted!'
    end
    redirect_to user_categories_path(current_user)
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
