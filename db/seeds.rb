10.times do |num|
  User.create!(
    email: "test#{num}@gmail.com",
    password: 'pppppppp',
    sex: [1,2].sample,
    first_name: "first_#{num}",
    last_name: "last_#{num}",
    first_kana: "first_kana#{num}",
    last_kana: "last_kana#{num}",
    phone_number: 9876543210,
    birth_year: [1966, 1977, 1988, 1999].sample,
    birth_month: 12.times.map{ |m| m + 1 }.sample,
    birth_date: 29.times.map{ |d| d + 1 }.sample,
  )
end

LikesUser.create!(user_id: 1, to_likes_user_id: 2, status: 2)
LikesUser.create!(user_id: 1, to_likes_user_id: 3, status: 1)
LikesUser.create!(user_id: 1, to_likes_user_id: 4, status: 0)
LikesUser.create!(user_id: 2, to_likes_user_id: 3, status: 0)
LikesUser.create!(user_id: 3, to_likes_user_id: 1, status: 1)
LikesUser.create!(user_id: 3, to_likes_user_id: 4, status: 1)
LikesUser.create!(user_id: 4, to_likes_user_id: 3, status: 1)

ChatRoom.create!()

RoomUser.create!(user_id: 1, chat_room_id: 1)
RoomUser.create!(user_id: 3, chat_room_id: 1)

Survey.all.map { |s| s.destroy! }
Survey.create!(title: '価値観診断', active: true)
survey = Survey.first
%w[
  物事を論理的に考える方だ
  得た知識や情報を分析するのが好きだ
  自分のことは自分で考える方だ
  よく友達に悩みを打ち明ける
  欲しいものを我慢しても、将来のために貯金する方がよい
  中古品を買うのは、なんとなく嫌だ
  常識にとらわれない方だ
  物事のプラス面よりもマイナス面の方が気になる
  独占欲が強い方だ
  感情が表にでやすい
  休日は出かけるのが好きだ
  困っている人をみかけたら、すぐに自分から声を掛ける
  嫌いな人と話すと不機嫌になりやすい
  苦労しても成長できるなら、それでよい
  何かを得るためには、自分からリスクを犯すことも必要だと思う
  落ち込んでもすぐに立ち直る方だ
  今の自分は本当の自分ではないと思うことがある
  ちょっとした欠点でも気になる方だ
].each { |q_title| survey.survey_questions.create!(title: q_title,question_type: 4) }

# SurveyAnswer.create!(user_id: 1, survey_id: 1)
# SurveyAnswer.create!(user_id: 1, survey_id: 3)
