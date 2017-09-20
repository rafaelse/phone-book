class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :exception
  before_action :authorize

  def authorize
    unless logged_in?
      redirect_to login_url, notice: "Please log in"
    end
  end

  def authorize_admin
    unless logged_in? and current_user.admin?
      redirect_to login_url, alert: "Área restrita à administradores"
    end
  end
end
