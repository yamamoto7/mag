json.array! @rooms do |room|
  user = room.users.where.not(id: current_user.id).first
  json.extract! user, :id, :email, :first_name, :last_name
  if user.user_images.exists? then
    json.image polymorphic_url(user.user_images.first.profile_image)
  else
    json.image '/assets/icon.png'
  end
end
