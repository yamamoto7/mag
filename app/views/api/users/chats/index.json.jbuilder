json.set! :rooms do
  json.array! @rooms do |room|
    json.extract! room, :id
    json.count room.get_new_message_count(current_user.id)
    json.set! :user do
      user = room.users.where.not(id: current_user.id).first
      json.extract! user, :id, :email, :first_name, :last_name
      if user.user_images.exists? then
        json.image polymorphic_url(user.user_images.first.profile_image)
      else
        json.image 'https://www.derev.com/uploads/crop/400/400/user/avatar/19193ef05fb2112f45763b62792106022bbab573.jpg'
      end
    end
  end
end
