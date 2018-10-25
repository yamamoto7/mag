json.set! :rooms do
  json.array! @rooms do |room|
    json.extract! room, :id
    json.count room.get_new_message_count(current_user.id)
    json.set! :user do
      json.extract! room.users.where.not(id: current_user.id).first, :id, :email
    end
  end
end
