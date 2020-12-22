module CommentsHelper
  def post_liked?(post,current_user)
    if current_user.liked_posts.where("post_id = ?", post).blank?
      link_to image_tag('dislike.png', id: "post_#{post.id}_loveicon"), like_path(post), remote: true, method: :post, class: 'like_button'
    else
      link_to image_tag('love.png', id: "post_#{post.id}_loveicon"), like_path(post), remote: true, method: :post, class: 'like_button'
    end
  end

  def delete_comment?(post,comment)
    link_to image_tag('trash.png'), post_comment_path(post,comment), remote: true, method: :delete, class: 'delete_comment' if comment.user == current_user
  end
end
