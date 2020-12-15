module ApplicationHelper
  def profile_picture_or_default(user)
    image_tag(user.image || 'no-profile.png')
  end
end
