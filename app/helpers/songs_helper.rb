module SongsHelper
  def dominantcolor(song)
    Miro.options[:color_count] = 3
    colors = Miro::DominantColors.new(song)
    colors.to_hex.last
  end
end
