class User < ApplicationRecord
  has_many :posts
  has_many :songs, through: :posts
  has_secure_password
  validates :email, uniqueness: true
  validates_confirmation_of :password
  has_many :post_comments
  has_many :commented_posts, through: :post_comments, source: :post
  has_many :likes, -> {where(liked: true)}
  has_many :liked_posts,  through: :likes, source: :post
  #has_many :liked_posts, -> {where(liked: true)}, class_name: "Like", foreign_key: :user_id, dependent: :destroy

  def self.find_or_create_from_spotify(auth)
    self.where(email: auth.info.email).first_or_create do |u|
      u.name = auth[:info][:name]
      u.image = auth[:info][:image]
      u.password = SecureRandom.hex(13)
    end
  end
end
