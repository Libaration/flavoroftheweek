class SongsController < ApplicationController

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
end
