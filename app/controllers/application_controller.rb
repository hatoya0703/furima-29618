class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth

  private

  def configure_permitted_parameters
    add_columns = [:nickname, :first_name, :last_name, :kana_first_name, :kana_last_name, :birth_date]
    devise_parameter_sanitizer.permit(:sign_up, keys:  add_columns)
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'hatoya0703' && password == '1989hayato'
    end
  end
end
