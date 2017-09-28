module UserAuthorization
  include SessionsHelper
  include ApplicationHelper

  def authorize
    unless logged_in?
      flash[:notice] = (t 'controller.concern.user_authorization.login_required')
      request.xhr? ? ajax_redirect_to(login_path) : redirect_to(login_url)
    end
  end

  def authorize_admin
    unless logged_in? and current_user.admin?
      redirect_to login_url, alert: (t 'controller.concern.user_authorization.restricted_to_admins')
    end
  end
end