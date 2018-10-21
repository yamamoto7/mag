# User.create!(email: 'test1@gmail.com', password: 'pppppppp')
# User.create!(email: 'test2@gmail.com', password: 'pppppppp')
# User.create!(email: 'test3@gmail.com', password: 'pppppppp')
# User.create!(email: 'test4@gmail.com', password: 'pppppppp')
# User.create!(email: 'test5@gmail.com', password: 'pppppppp')

# LikesUser.create!(user_id: 1, to_likes_user_id: 3, status: 1)
# LikesUser.create!(user_id: 1, to_likes_user_id: 4, status: 1)
# LikesUser.create!(user_id: 2, to_likes_user_id: 3, status: 1)
# LikesUser.create!(user_id: 3, to_likes_user_id: 1, status: 1)
# LikesUser.create!(user_id: 3, to_likes_user_id: 4, status: 1)
# LikesUser.create!(user_id: 4, to_likes_user_id: 3, status: 1)

# ChatRoom.create!()

# RoomUser.create!(user_id: 1, chat_room_id: 1)
# RoomUser.create!(user_id: 3, chat_room_id: 1)

Survey.create!(title: 'おためしアンケート1')
Survey.create!(title: 'おためしアンケート2')
Survey.create!(title: 'おためしアンケート3')

SurveyAnswer.create!(user_id: 1, survey_id: 1)
SurveyAnswer.create!(user_id: 1, survey_id: 3)
