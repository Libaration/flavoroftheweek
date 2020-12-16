module PostsHelper
  def content_or_quote(post)
    post.original_post.present? ? "<div class=\"contentquote\">\"#{post.content}</div>\"".html_safe : post.content
  end
end
