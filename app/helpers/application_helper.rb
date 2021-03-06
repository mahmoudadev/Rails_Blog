module ApplicationHelper

  def gravatar_for(user, size )
    gravatar_id  = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, class: "m-4 rounded-circle")
  end

end
