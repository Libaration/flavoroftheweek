class PostsController < ApplicationController
  before_action :require_login
  def index
    params[:user_id] ? @posts = User.find(params[:user_id]).posts : @posts = Post.all
  end
  def repost
    @post = Post.find(params[:id])
    Post.create_from_repost(@post, current_user)
    redirect_to posts_path
  end

  def require_login
    redirect_to login_path unless session.include? :user_id
  end
  def current_user
    User.find(session[:user_id])
  end
end
