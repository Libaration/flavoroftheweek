class PostsController < ApplicationController
  before_action :require_login
  def index
    @posts = Post.all.reverse
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
