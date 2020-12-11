module ApplicationHelper

  def grab_background(artist)

    request = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV['GIFKEY']}&q=#{artist}&limit=5&offset=0&rating=g&lang=en").to_json
    response = JSON.parse(request)["data"]

    bgvid = nil
    response.each do |gif|
      break if bgvid.present?
      bgvid = gif["images"]["hd"]["mp4"] if gif["images"]["hd"].present?
    end
    bgvid
  end
end
