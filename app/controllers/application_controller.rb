class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :set_render_cart
  before_action :initialize_cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :contact_number, :terms_and_conditions, :role])
    # Add other Devise parameters as needed...
  end
  
  def set_render_cart
    @render_cart = true
  end
  
  def initialize_cart
    @cart ||= Cart.find_by(id:session[:cart_id])
  
    if @cart.nil?
      @cart = Cart.create
      session[:cart_id]= @cart.id
    end
  end

  protected
  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.role == 'Admin'
      return admins_path
    elsif resource.is_a?(User) && resource.role == 'Vendor'
      return vendors_path
      else
      return super
    end
  end
 
end




