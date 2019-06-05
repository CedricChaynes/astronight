class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_locale
  before_action :set_raven_context

  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :mobile, :avatar) }
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :mobile, :avatar])
  end

  private

  def set_raven_context
    Raven.user_context(id: session[:current_user_id]) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "www.astronight.space" }
  end
end
