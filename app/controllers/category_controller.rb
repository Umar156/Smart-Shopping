class CategoryController < ApplicationController
  def index
    @category = Category.all
    if params[:search]
      @search_term = params[:search]
      @products = @products.search_by(@search_term)
    end
  end

  def new
    if user_signed_in? 
    @category = Category.new
  else
    redirect_to new_user_session_path
  end
  end

 
  def create
    @category = Category.new(category_params)
  
    if @category.save
      redirect_to products_path
    else
      render :new , status: :unprocessable_entity
    end
  end

  def cat_products
    @products = Category.find(params[:id]).products
  end
 

  private
  def category_params
    params.permit(:name)
  end

end

