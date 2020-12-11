class SongsController < ApplicationController
  require 'rspotify'

  def new
    @song = Song.new
  end

  def create
    @song_hash =  search_track("#{params[:song][:title]} #{params[:song][:artist]}")
    @song = Song.find_or_create_by_spotify(@song_hash)
    redirect_to song_path(@song)
  end

  def show
    @song = Song.find(params[:id])
  end

  private

  def song_params
    params.require(:song).permit(:title,:artist)
  end

  def search_track(track)
    RSpotify.authenticate(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
    RSpotify::Track.search(track).first
  end
end
