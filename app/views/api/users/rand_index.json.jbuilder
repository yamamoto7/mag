json.array! @users do |user|
  json.extract! user, :id, :email, :first_name, :last_name, :state, :profile, :salary, :job
  if user.user_images.exists? then
    json.image polymorphic_url(user.user_images.first.profile_image)
  else
    json.image '/assets/icon.png'
  end
end
