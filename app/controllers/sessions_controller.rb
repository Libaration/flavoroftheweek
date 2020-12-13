class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  def create
    if auth
      @user = User.find_or_create_from_spotify(auth)
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @user = User.where('email IS ?', params[:user][:email]).first
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_path
      elsif !@user
        redirect_to login_path, alert: "User not found"
      else
        redirect_to login_path, alert: "Incorrect password"
      end
    end
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end
