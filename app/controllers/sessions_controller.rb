class SessionsController < ApplicationController
  def new
  end

  def create
    session = params[:session]
    user = User.find_by email: session[:email].downcase

    if user && user.authenticate(session[:password])
      log_in user
      session[:remember_me] == "1" ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = t "error_login_message"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
