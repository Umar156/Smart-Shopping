class CartController < ApplicationController
  before_action :redirect_based_on_login_status
  
  def show
    
  end
 
 

  def redirect_based_on_login_status
    if user_signed_in?
      
    else
      redirect_to new_user_session_path
    end
  end
  

  def add
    if user_signed_in? 
      @product = Product.find_by(id: params[:id])
      quantity = params[:quantity].to_i
      current_orderable = @cart.orderables.find_by(product_id: @product.id)
      if current_orderable && quantity > 0
        current_orderable.update(quantity:)
      elsif quantity <= 0
        current_orderable.destroy
      else
        @cart.orderables.create(product: @product, quantity:)
      end
    
      redirect_to cart_path
     else
      redirect_to new_user_session_path
    
    end
  end
  
  def remove
    Orderable.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.turbo_stream do 
        render turbo_stream: turbo_stream.replace('cart',
        template: 'cart/show',
        locals: { cart: @cart })
      end
   end
  end
  
end
