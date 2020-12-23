class UsersController < ApplicationController
  layout "posts", only: :show
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.valid?

    else
      render :'users/new'
    end
  end
  def index

  end

  def show
    @posts = current_user.liked_posts
  end
  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_params
    params.require(:user).permit(:name, :email,:password,:password_confirmation)
  end
end
