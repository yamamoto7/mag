json.have_already_liked @have_already_liked
json.set! :user do
  json.extract! @user, :id, :email
  if @user.user_images.exists? then
    json.image polymorphic_url(@luser.user_images.first.profile_image)
  else
    json.image 'https://www.derev.com/uploads/crop/400/400/user/avatar/19193ef05fb2112f45763b62792106022bbab573.jpg'
  end
end
