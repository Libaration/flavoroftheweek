class PostsController < ApplicationController
  before_action :require_login
  def index
    @posts = Post.all
  end
  def repost
    @post = Post.find(params[:id])
    raise @post.inspect
  end

  def require_login
    redirect_to login_path unless session.include? :user_id
  end
end
