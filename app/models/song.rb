class Song < ApplicationRecord
  require 'rspotify'


  private

  def self.search_artist(artist)
    RSpotify.authenticate(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
    RSpotify::Artist.search(artist).first
  end
  def self.search_track(track)
    RSpotify.authenticate(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
    RSpotify::Track.search(track).first
  end
end
