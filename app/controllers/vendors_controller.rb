class VendorsController < ApplicationController
  def index
    if user_signed_in? && current_user.role == "Vendor"
     
    else
      redirect_to new_user_session_path
  end
  end
end
