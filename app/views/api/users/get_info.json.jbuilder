json.extract! @user, :id, :email, :birth_year, :birth_month, :birth_date,
    :first_name, :last_name,
    :phone_number, :profile,
    :sex, :tall, :weight_type, :academic, :blood_type,
    :state, :birth_state, :brother, :martial_status, :children,
    :salary, :job, :job_detail, :academic_status,
    :holiday, :check_point, :when_meet, :cigarette, :alcohol
if @user.user_images.exists? then
  json.image polymorphic_url(@user.user_images.first.profile_image)
  json.set! :images do
    json.array! @user.user_images do |img|
      json.url polymorphic_url(img.profile_image)
    end
  end
else
  json.image '/assets/icon.png'
end
