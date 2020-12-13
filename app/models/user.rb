class User < ApplicationRecord
  has_secure_password
  has_many :songs, through: :user_songs
  validates :email, uniqueness: true
  validates_confirmation_of :password
end
