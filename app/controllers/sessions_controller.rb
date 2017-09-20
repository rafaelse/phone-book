class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user.try(:authenticate, params[:password])
      log_in user
      redirect_to users_url, notice: 'Login efetuado com sucesso'
    else
      redirect_to login_url, alert: 'Usuário ou senha inválidos'
    end
  end

  def destroy
    log_out
    redirect_to root_url, notice: "Logged out"
  end
end
