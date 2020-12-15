class User < ApplicationRecord
  has_many :posts
  has_many :songs, through: :posts
  has_secure_password
  validates :email, uniqueness: true
  validates_confirmation_of :password

  def self.find_or_create_from_spotify(auth)
    self.where(email: auth.info.email).first_or_create do |u|
      u.name = auth[:info][:name]
      u.image = auth[:info][:image]
      u.password = SecureRandom.hex(13)
    end
  end
end
