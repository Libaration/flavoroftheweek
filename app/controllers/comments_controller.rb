class CommentsController < ApplicationController
  layout "posts"
  def index
    @post = Post.find(params[:post_id])
  end
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params.merge(user: current_user))
    respond_to do |format|
      if @comment.save
        format.js
      else
        format.html {redirect_to post_comments_path(@post)}
      end
    end
  end

  def destroy
    @comment = PostComment.find(params[:id])
    respond_to do |format|
      if @comment.destroy
        format.js
      else
        format.html {redirect_to post_comments_path(@post)}
      end
    end
  end

  private


  def comment_params
    params.require(:post_comment).permit(:message, :post_id, :user_id)
  end

  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
