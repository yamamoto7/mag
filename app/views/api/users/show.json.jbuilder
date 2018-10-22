json.have_already_liked @have_already_liked
json.set! :user do
  json.extract! @user, :id, :email
end
