module PostsHelper
  def content_or_quote(post)
    post.original_post.present? ? "<div class=\"contentquote\">\"#{post.content}</div>\"".html_safe : post.content
  end
  def delete_button?(post)
    link_to image_tag('trash.png'), post, method: :delete, remote: true, class: 'delete_post' if post.user == current_user
  end
end
