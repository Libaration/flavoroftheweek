class Post < ApplicationRecord
  belongs_to :user
  belongs_to :song
  belongs_to :original_post, class_name: 'Post', foreign_key: 'original_id', optional: true
  has_many :comments, class_name: "PostComment", foreign_key: :post_id

  def self.create_from_repost(post, currentuser)
    create(song: post.song, user: currentuser, content: post.content, original_post: post)
  end

  def song_hash=(song)
    self.song = Song.find_or_create_by_spotify(song)
  end
end
