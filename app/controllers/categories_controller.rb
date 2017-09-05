class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Successfully created the category!"
      redirect_to category_path(@category)
    else
      flash[:failure] = "Category not created. Maybe a field was left blank, or that category already exists?"
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    if
      @category = Category.update(category_params)
      redirect_to category_path(@category)
    else
      flash[:falilure] = "Category not updated."
      render :edit
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:success] = "category was successfully deleted!"
      redirect_to categories_path
    else
      flash[:failure] = "Category not deleted"
      render :index
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
