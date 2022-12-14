class ApplicationController < ActionController::Base
  before_action :basic_origin if Rails.env.production? # 本番環境のみBasic認証
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[nickname age sex_id height weight])
  end

  def basic_origin
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_ORIGIN_USER'] && password == ENV['BASIC_ORIGIN_PASSWORD']
    end
  end
end
