class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: [:cancel]
  prepend_before_action :authenticate_scope!, only: []
  
  
  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :name, :address)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :points, :name, :address)
  end
  
  def sign_up(resource_name, resource)

  end
  
end