class ApplicationController < ActionController::Base
  require 'rspotify'
  def search_track(track)
    RSpotify.authenticate(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
    RSpotify::Track.search(track).first
  end
end
