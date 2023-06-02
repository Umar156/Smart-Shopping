class ProductsController < ApplicationController
  def index
    if user_signed_in? 
    @products = Product.all
    if params[:search]
      @search_term = params[:search]
      @products = @products.search_by(@search_term)
    end
  else
    redirect_to new_user_session_path
  end
  end

  def show
    if user_signed_in? 
    @products = Product.find(params[:id])
  else
    redirect_to new_user_session_path
  end
  end

  def new
    if user_signed_in? 
    @products = Product.new
    @category = Category.order('position ASC')
  else
    redirect_to new_user_session_path
  end
  end

  def create
    @products = Product.new(product_params) 
    if @products.save
      redirect_to products_path
      
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @products = Product.find(params[:id])
  end

  def update
    @products = Product.find(params[:id])
    if @products.update(product_params)
      redirect_to products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @products = Product.find(params[:id])
    @products.destroy
    redirect_to products_path
  end


  private
  def product_params
    params.require(:product).permit(:category_id, :name, :price, :description, :quantity, :avatar)
  end
end
