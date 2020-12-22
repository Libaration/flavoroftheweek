class CommentsController < ApplicationController
  layout "posts"
  def index
    @post = Post.find(params[:post_id])
    @song = @post.song
  end
end
