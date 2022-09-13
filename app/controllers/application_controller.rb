# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:address, :postcode, :bio])
  end

  private

  def after_sign_in_path_for(resource)
    books_path
  end
  
  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
