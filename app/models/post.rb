class Post < ApplicationRecord
  belongs_to :user
  belongs_to :song
  belongs_to :original_post, class_name: 'Post', foreign_key: 'original_id', optional: true
end
