class PostsController < ApplicationController

  before_action :require_login
  def index
    params[:user_id] ? @posts = User.find(params[:user_id]).posts : @posts = Post.all
  end

  def repost
    @post = Post.create_from_repost(Post.find(params[:id]), current_user)
    respond_to do |format|
      if @post.save
        format.js
      else
        format.html {redirect_to posts_url}
      end
    end
  end

  def new
    @post = Post.new
  end

  def destroy
      @post = Post.find(params[:id])
      @post.destroy if current_user == @post.user
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
      format.js
    end
  end

  def create
    @post = current_user.posts.create(content: params[:post][:content], song_hash: search_track("#{params[:song][:title]} #{params[:song][:artist]}"))
    respond_to do |format|
      if @post.save
        format.js
      else
        format.html {redirect_to posts_url}
      end
    end
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
