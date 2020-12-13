class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.where('email IS ?', params[:user][:email]).first
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      #redirect when i get around to making the model.
    elsif !@user
      redirect_to login_path, alert: "User not found"
    else
      redirect_to login_path, alert: "Incorrect password"
    end
  end
end
