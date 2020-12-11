class Song < ApplicationRecord

  def self.find_or_create_by_spotify(song)
    where(:url => song.preview_url).first_or_create do |s|
      s.artist = song.artists.first.name
      s.title = song.name
      s.uri = song.id
      s.image = song.album.images.first["url"]
    end
  end
end
