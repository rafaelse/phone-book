module UserAuthorization
  include SessionsHelper

  def authorize
    unless logged_in?
      redirect_to login_url, notice: (t 'controller.concern.user_authorization.login_required')
    end
  end

  def authorize_admin
    unless logged_in? and current_user.admin?
      redirect_to login_url, alert: (t 'controller.concern.user_authorization.restricted_to_admins')
    end
  end
end