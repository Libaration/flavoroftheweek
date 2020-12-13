Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], scope: %w(
    playlist-read-private
    user-read-private
    user-read-email
    playlist-modify-public
    playlist-modify-private
    user-library-read
    user-library-modify
  ).join(' ')
end