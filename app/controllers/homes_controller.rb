class HomesController < ApplicationController
  def index
    @pagy, @products = pagy(Product.all.order(created_at: :desc))
    @category = Category.all
    if params[:search]
      @search_term = params[:search]
      @products = @products.search_by(@search_term)
    end
 
  end
end
