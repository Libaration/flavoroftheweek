class Post < ApplicationRecord
  belongs_to :user
  belongs_to :song
  belongs_to :original_post, class_name: 'Post', foreign_key: 'original_id', optional: true

  def self.create_from_repost(post, currentuser)
    create(song: post.song, user: currentuser, content: post.content, original_post: post)
  end
end
