class CommentsController < ApplicationController
  layout "posts"
  def index
    @post = Post.find(params[:post_id])
  end
  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params.merge(user: current_user))
    redirect_to post_comments_path(@post)
  end

  def comment_params
    params.require(:post_comment).permit(:message, :post_id, :user_id)
  end

  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
