class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user.try(:authenticate, params[:password])
      log_in user
      redirect_to root_url, notice: (t 'controller.session.login_success')
    else
      flash.now[:alert] = (t 'controller.session.login_fail')
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url, notice: (t 'controller.session.logout_success')
  end
end
