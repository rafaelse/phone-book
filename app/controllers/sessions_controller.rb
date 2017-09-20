class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user.try(:authenticate, params[:password])
      log_in user
      redirect_to root_url, notice: 'Login efetuado com sucesso'
    else
      flash.now[:alert] = 'Usuário ou senha inválidos'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url, notice: "Logged out"
  end
end
