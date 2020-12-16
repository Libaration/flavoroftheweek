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

  def new
    @post = Post.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to songs_url }
      format.json { head :no_content }
      format.js
    end
  end

  def create
    @post = current_user.posts.create(content: params[:post][:content], song_hash: search_track("#{params[:song][:title]} #{params[:song][:artist]}"))
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:category_name, :content)
  end
  def require_login
    redirect_to login_path unless session.include? :user_id
  end
  def current_user
    User.find(session[:user_id])
  end
end
