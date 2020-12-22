class Post < ApplicationRecord
  belongs_to :user
  belongs_to :song
  belongs_to :original_post, class_name: 'Post', foreign_key: 'original_id', optional: true
  has_many :comments, class_name: "PostComment", foreign_key: :post_id
  has_many :likes, -> {where(liked: true)}

  def self.create_from_repost(post, currentuser)
    create(song: post.song, user: currentuser, content: post.content, original_post: post)
  end

  def song_hash=(song)
    self.song = Song.find_or_create_by_spotify(song)
  end

  def like_or_dislike(user)
      post =  self.likes.where(user_id: user).first

      if post.nil?
          self.likes.where(user_id: user).first_or_create do |p|
          p.liked = true
          p.post_id = self
          end
          else
            post.liked == true ? post.update(liked: false) : post.update(liked: true)
      end
  end
end
