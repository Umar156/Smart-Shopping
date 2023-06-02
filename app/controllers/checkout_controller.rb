class CheckoutController < ApplicationController
  def new
    if user_signed_in? 
      @checkouts = Checkout.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @checkouts = Checkout.new(checkout_params) 
    if @checkouts.save
      if params[:payment_method] == "JazzCash"
        redirect_to jazzcash_path
      elsif
        params[:payment_method] == "Easypaisa"
        redirect_to easypaisa_path
      elsif
        params[:payment_method] == "Cash On Delivery"
        redirect_to root_path
      elsif
        params[:payment_method] == "Visa/Master Card"
        redirect_to mastercard_path

      else
        render :new, status: :unprocessable_entity
      end

    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def checkout_params
    params.permit(:full_name, :email, :phone_number, :province, :city, :address,:payment_method)
  end
end
