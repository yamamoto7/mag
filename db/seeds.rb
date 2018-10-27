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

diagnoses = %w[
  愛されマスコットタイプ,人に愛される屈託の無いタイプです。,1,人との壁が無く常に笑顔で皆の中心にいる好青年。くよくよ考え込まずとても明るいのが特徴です。有名人に例えるなら・・・上地祐輔、ウエンツ瑛士、チャップリン
  愛されマスコットタイプ,人に愛される屈託の無いタイプです。,2,活発で人見知りせず、誰とでも上手くコミュニケーションがとれる交際上手な所が特徴です。有名人に例えるなら・・・ローラ、鈴木奈々、クレオパトラ
  皆に慕われる理想の先輩タイプ,周囲からの信頼が厚い面倒見の良いタイプです。,1,人を導く頼れるリーダー的な存在。とても上昇志向が強く論理的に物事を捉えるのが特徴です。有名人に例えるなら・・・佐藤浩一、佐々木蔵之介、上杉謙信
  皆に慕われる理想の先輩タイプ,周囲からの信頼が厚い面倒見の良いタイプです。,2,自分をしっかりと持っていて、かつ細かいことは気にしない性格は、良い意味でお姉さん的な存在。有名人に例えるなら・・・天海祐希、松嶋菜々子、春日局
  明るく社交的な楽天家タイプ,誰とでも気軽に話せる、交際上手なタイプです。,1,どんな相手でも変わらない態度で付き合う開放的な人柄。誰とでもすぐに仲良くなれるのが特徴です。有名人に例えるなら・・・DAIGO、綾部祐二（ピース）、豊臣秀吉
  明るく社交的な楽天家タイプ,誰とでも気軽に話せる、交際上手なタイプです。,2,明るく開放的な人柄で友人がとても多い所が特徴。アクティブなので女子会にも積極的に参加！有名人に例えるなら・・・関根麻里、小島瑠璃子、マリリン・モンロー
  熱血！キャプテンタイプ,とにかく明るく前向きでポジティブなタイプです。,1,とてもチャレンジ志向が強く、気持ちで周囲の人間を引っ張っていく熱血感溢れる所が特徴です。有名人に例えるなら・・・松岡修造、佐藤隆太、近藤勇
  熱血！キャプテンタイプ,とにかく明るく前向きでポジティブなタイプです。,2,他人を思いやる優しい心と上昇志向を併せ持つリーダー的な存在。胸に秘めた熱いハートが特徴です。有名人に例えるなら・・・高橋みなみ、井上真央、ジャンヌダルク
  芯の強い人情家タイプ,真っ直ぐな芯の強さと心の優しさを併せ持つタイプです。,1,自立心と成長意欲が高く、ストイックに物事を追求する所が特徴。背中で語る男らしい存在。有名人に例えるなら・・・長谷部誠、市原隼人、武田信玄
  芯の強い人情家タイプ,真っ直ぐな芯の強さと心の優しさを併せ持つタイプです。,2,行動的で、人を思いやる気持ちが強いので、周囲からは頼られることの多いアネゴ的な存在。有名人に例えるなら・・・山口智子、篠原涼子、ヘレン・ケラー
  自由気ままなマイワールドタイプ,細かいことは気にしない自由奔放なタイプです。,1,直感力がとても強く既成の理論や固定概念にとらわれず行動するところが特徴です。有名人に例えるなら・・・木梨憲武、GACKT、レオナルド・ダ・ヴィンチ
  自由気ままなマイワールドタイプ,細かいことは気にしない自由奔放なタイプです。,2,世の中の流行に左右されず、自分のモノサシで判断するとても直観的な所が特徴です。有名人に例えるなら・・・吉高由里子、中川翔子、淀君
  強い意志を持つカリスマタイプ,意志の強さが人を惹きつける、スター性のあるタイプです。,1,自分の明確な価値観を持ち、他人の意見に左右されない、いわゆる「ブレないオトコ」。有名人に例えるなら・・・小栗旬、本田圭祐、織田信長
  強い意志を持つカリスマタイプ,意志の強さが人を惹きつける、スター性のあるタイプです。,2,感情表現豊かで人に媚びることが少ないため、同性からも異性からも憧れられる所が特徴です。有名人に例えるなら・・・安室奈美恵、椎名林檎、マーガレット・サッチャー
  いつも冷静な論理派タイプ,クールで頭のいい、自分に自信のあるタイプです。,1,ハメを外すことが少なく、常に冷静でロジカルに物事を考えられる合理主義な所が特徴です。有名人に例えるなら・・・堺雅人、伊勢谷友介、諸葛孔明
  いつも冷静な論理派タイプ,クールで頭のいい、自分に自信のあるタイプです。,2,いつも冷静で、論理的に考えないと気が済まないのが特徴の、いわゆる「仕事のできるオンナ」。有名人に例えるなら・・・仲間由紀恵、菊川玲、アガサ・クリスティ
  堅実な安定思考タイプ,何事もコツコツと慎重に進めることができるタイプです。,1,堅実で自立心が強く誠実、仕事でもプライベートでも非常に安定感があるのが特徴です。有名人に例えるなら・・・谷原章介、桝太一、徳川家康
  堅実な安定思考タイプ,何事もコツコツと慎重に進めることができるタイプです。,2,まじめで一つひとつ物事を片づけられるしっかり者。家事や仕事を安心して任せられるのが特徴です。有名人に例えるなら・・・綾瀬はるか、大江麻理子、キュリー夫人
  素直な甘えん坊タイプ,小動物系、守ってあげたくなるタイプです。,1,素直で感情表現が豊か、場の空気も読むことができるので、グループで可愛がられる存在です。有名人に例えるなら・・・佐藤健、中尾明慶、沖田総司
  素直な甘えん坊タイプ,小動物系、守ってあげたくなるタイプです。,2,裏表が無く、感情表現が豊かで、皆に可愛がられる存在。いるだけで場の雰囲気が和やかに。有名人に例えるなら・・・能年玲奈、広瀬すず、オードリー・ヘップバーン
  思い立ったら即行動！即決即断タイプ,自身の直感を大切にする、行動派なタイプです。,1,決めたらすぐに行動に移す所が特徴です。ためらいがなく、思い切りの良い行動は好印象。有名人に例えるなら・・・藤原竜也、山口智充、坂本龍馬
  思い立ったら即行動！即決即断タイプ,自身の直感を大切にする、行動派なタイプです。,2,前向きで、堂々と胸を張って行動に移せる活動的な2。清々しいまでの行動力が特徴です。有名人に例えるなら・・・大島優子、戸田恵梨香、ナイチンゲール
  他人思いの優しさ満点タイプ,｢人の気持ち｣と｢周囲との和｣を大切にする優しいタイプです。,1,協調性が高く、思いやりも強いのでグループの中での良い調整役。優しい気配りが魅力です。有名人に例えるなら・・・溝端淳平、神木隆之介、ガンジー
  他人思いの優しさ満点タイプ,｢人の気持ち｣と｢周囲との和｣を大切にする優しいタイプです。,2,人が楽しんでなかったり、落ち込んでいたりすると、つい気にかけてしまう優しさが特徴です。有名人に例えるなら・・・小西真奈美、西田尚美、マザー・テレサ
  いつもしっかり現実派タイプ,何事にも慎重なしっかりさんタイプです。,1,物事を現実的に捉えて、計画的に行動する所が特徴。失敗が少なく周囲からの信頼感は抜群。有名人に例えるなら・・・吉岡秀隆、又吉直樹（ピース）、太宰治
  いつもしっかり現実派タイプ,何事にも慎重なしっかりさんタイプです。,2,計画的に行動でき、自分よりもまず他人のことを考えられるとても優しい人柄です。有名人に例えるなら・・・深津絵里、堀北真希、篤姫
]

diagnoses.each do |str|
  values = str.split(',')
  Diagnosis.create!(
    title: values[0],
    catchcopy: values[1],
    sex: values[2],
    description: values[3],
    match_id: Random.rand(13) + 1,
  )
end
User.create!(email: "20@m",password: 'pppppppp',sex: 2,first_name: "市川",last_name: "ひなた",first_kana: "ヤナセ",last_kana: "ミク",phone_number: 9876543210,birth_year: [1966, 1977, 1988, 1999].sample,birth_month: 11,birth_date: 19,profile: "趣味はカラオケです！　レゴランドでバイトしてるので、レゴのことなら何でも聞いてください！",diagnoses_id: 1,tall: 157,weight_type: "小柄",academic: "大学",blood_type: "B型",state: "岐阜県",birth_state: "三重県",brother: "長女",martial_status: "なし",children: "いない",salary: "~200万",job: "学生",job_detail: "大学生",academic_status: "在学",holiday: "土日",check_point: "写真",when_meet: "気が合えば会いたい",cigarette: "吸わない",alcohol: "飲まない")
User.create!(email: "4@m",password: 'pppppppp',sex: 2,first_name: "真理子",last_name: "阿部",first_kana: "マリコ",last_kana: "アベ",phone_number: 9876543210,birth_year: [1966, 1977, 1988, 1999].sample,birth_month: 11,birth_date: 15,profile: "女子大で出会いがなかったので初めて見ました。",diagnoses_id: 1,tall: 157,weight_type: "ふつう",academic: "大学",blood_type: "A型",state: "愛知県",birth_state: "三重県",brother: "長女",martial_status: "なし",children: "いない",salary: "~200万",job: "学生",job_detail: "大学3年生",academic_status: "在学",holiday: "平日",check_point: "プロフィールの充実度",when_meet: "まずは会いたい",cigarette: "吸わない",alcohol: "時々")
User.create!(email: "15@m",password: 'pppppppp',sex: 2,first_name: "ひとみ",last_name: "古谷",first_kana: "ヒトミ",last_kana: "フルヤ",phone_number: 9876543210,birth_year: [1966, 1977, 1988, 1999].sample,birth_month: 10,birth_date: 3,profile: "趣味はカラオケです！　レゴランドでバイトしてるので、レゴのことなら何でも聞いてください！",diagnoses_id: 1,tall: 157,weight_type: "小柄",academic: "大学",blood_type: "O型",state: "大阪府",birth_state: "岐阜県",brother: "長女",martial_status: "なし",children: "いない",salary: "~200万",job: "学生",job_detail: "女子大",academic_status: "在学",holiday: "土日",check_point: "その他",when_meet: "メッセージをしっかり重ねてから",cigarette: "吸わない",alcohol: "飲まない")
User.create!(email: "16@m",password: 'pppppppp',sex: 2,first_name: "優美",last_name: "大沢",first_kana: "ユウミ",last_kana: "オオサワ",phone_number: 9876543210,birth_year: [1966, 1977, 1988, 1999].sample,birth_month: 11,birth_date: 26,profile: "趣味はカラオケです！　レゴランドでバイトしてるので、レゴのことなら何でも聞いてください！",diagnoses_id: 1,tall: 157,weight_type: "ふっくら",academic: "大学",blood_type: "B型",state: "大阪府",birth_state: "愛知県",brother: "長女",martial_status: "なし",children: "いない",salary: "~200万",job: "パート",job_detail: "コンビニ",academic_status: "卒業",holiday: "土日",check_point: "写真",when_meet: "メッセージをしっかり重ねてから",cigarette: "吸わない",alcohol: "飲まない")
User.create!(email: "1@m",password: 'pppppppp',sex: 2,first_name: "みはる",last_name: "角田",first_kana: "ミハル",last_kana: "ツノダ",phone_number: 9876543210,birth_year: [1966, 1977, 1988, 1999].sample,birth_month: 3,birth_date: 21,profile: "趣味はカラオケです！　レゴランドでバイトしてるので、レゴのことなら何でも聞いてください！",diagnoses_id: 1,tall: 157,weight_type: "ふつう",academic: "大学",blood_type: "A型",state: "愛知県",birth_state: "三重県",brother: "次女",martial_status: "なし",children: "いない",salary: "200~300万",job: "保育士",job_detail: "",academic_status: "卒業",holiday: "その他",check_point: "プロフィールの充実度",when_meet: "気が合えば会いたい",cigarette: "時々",alcohol: "飲む")
User.create!(email: "13@m",password: 'pppppppp',sex: 2,first_name: "ゆき",last_name: "名瀬川",first_kana: "ユキ",last_kana: "ハセガワ",phone_number: 9876543210,birth_year: [1966, 1977, 1988, 1999].sample,birth_month: 5,birth_date: 2,profile: "大学2年だよ、大学生の人探しています。よろしくお願いします",diagnoses_id: 1,tall: 157,weight_type: "太め",academic: "大学",blood_type: "AB型",state: "三重県",birth_state: "三重県",brother: "次女",martial_status: "なし",children: "いない",salary: "~200万",job: "学生",job_detail: "3年生",academic_status: "在学",holiday: "平日",check_point: "価値観",when_meet: "気が合えば会いたい",cigarette: "吸わない",alcohol: "時々")
User.create!(email: "11@m",password: 'pppppppp',sex: 2,first_name: "あや",last_name: "中島",first_kana: "アヤ",last_kana: "ナカジマ",phone_number: 9876543210,birth_year: [1966, 1977, 1988, 1999].sample,birth_month: 4,birth_date: 14,profile: "趣味はカラオケです！　レゴランドでバイトしてるので、レゴのことなら何でも聞いてください！",diagnoses_id: 1,tall: 157,weight_type: "太め",academic: "大学",blood_type: "AB型",state: "静岡県",birth_state: "岐阜県",brother: "次女",martial_status: "なし",children: "いない",salary: "200~300万",job: "保育士",job_detail: "",academic_status: "卒業",holiday: "不定期",check_point: "価値観",when_meet: "気が合えば会いたい",cigarette: "吸わない",alcohol: "時々")
User.create!(email: "19@m",password: 'pppppppp',sex: 2,first_name: "わかな",last_name: "佐野",first_kana: "ワカナ",last_kana: "サノ",phone_number: 9876543210,birth_year: [1966, 1977, 1988, 1999].sample,birth_month: 4,birth_date: 6,profile: "趣味はカラオケです！　レゴランドでバイトしてるので、レゴのことなら何でも聞いてください！",diagnoses_id: 1,tall: 157,weight_type: "ふっくら",academic: "大学",blood_type: "A型",state: "岐阜県",birth_state: "三重県",brother: "次女",martial_status: "なし",children: "いない",salary: "~300~400万",job: "看護師",job_detail: "",academic_status: "卒業",holiday: "土日",check_point: "価値観",when_meet: "気が合えば会いたい",cigarette: "吸わない",alcohol: "飲まない")
User.create!(email: "7@m",password: 'pppppppp',sex: 2,first_name: "由紀",last_name: "高井",first_kana: "ユキ",last_kana: "タカイ",phone_number: 9876543210,birth_year: [1966, 1977, 1988, 1999].sample,birth_month: 12,birth_date: 6,profile: "身長高い人が好きです。最近タバコを始めました",diagnoses_id: 1,tall: 157,weight_type: "ふつう",academic: "大学",blood_type: "O型",state: "京都府",birth_state: "三重県",brother: "次女",martial_status: "なし",children: "いない",salary: "~200万",job: "学生",job_detail: "大学3年生",academic_status: "在学",holiday: "平日",check_point: "価値観",when_meet: "気が合えば会いたい",cigarette: "時々",alcohol: "時々")
User.create!(email: "6@m",password: 'pppppppp',sex: 2,first_name: "有紀子",last_name: "石崎",first_kana: "ユキコ",last_kana: "イシザキ",phone_number: 9876543210,birth_year: [1966, 1977, 1988, 1999].sample,birth_month: 9,birth_date: 22,profile: "趣味はカラオケです！　レゴランドでバイトしてるので、レゴのことなら何でも聞いてください！",diagnoses_id: 1,tall: 157,weight_type: "ふつう",academic: "大学",blood_type: "O型",state: "京都府",birth_state: "三重県",brother: "長女",martial_status: "なし",children: "いない",salary: "~200万",job: "パート",job_detail: "スーパーの店員",academic_status: "卒業",holiday: "土日",check_point: "価値観",when_meet: "気が合えば会いたい",cigarette: "時々",alcohol: "時々")
User.create!(email: "2@m",password: 'pppppppp',sex: 2,first_name: "恵美",last_name: "本田",first_kana: "エミ",last_kana: "ホンダ",phone_number: 9876543210,birth_year: [1966, 1977, 1988, 1999].sample,birth_month: 7,birth_date: 8,profile: "趣味はカラオケです！　レゴランドでバイトしてるので、レゴのことなら何でも聞いてください！",diagnoses_id: 1,tall: 157,weight_type: "ふっくら",academic: "大学",blood_type: "AB型",state: "愛知県",birth_state: "愛知県",brother: "長女",martial_status: "なし",children: "いない",salary: "~200万",job: "保育士",job_detail: "",academic_status: "卒業",holiday: "平日",check_point: "価値観",when_meet: "気が合えば会いたい",cigarette: "吸う",alcohol: "飲む")
User.create!(email: "8@m",password: 'pppppppp',sex: 2,first_name: "美香",last_name: "澤田",first_kana: "ミカ",last_kana: "サワダ",phone_number: 9876543210,birth_year: [1966, 1977, 1988, 1999].sample,birth_month: 1,birth_date: 2,profile: "趣味はカラオケです！　レゴランドでバイトしてるので、レゴのことなら何でも聞いてください！",diagnoses_id: 1,tall: 157,weight_type: "ふつう",academic: "大学",blood_type: "B型",state: "静岡県",birth_state: "岐阜県",brother: "長女",martial_status: "なし",children: "いない",salary: "~200万",job: "学生",job_detail: "2年生",academic_status: "在学",holiday: "不定期",check_point: "価値観",when_meet: "メッセージをしっかり重ねてから",cigarette: "吸わない",alcohol: "時々")
User.create!(email: "18@m",password: 'pppppppp',sex: 2,first_name: "なお",last_name: "北沢",first_kana: "ナオ",last_kana: "キタザワ",phone_number: 9876543210,birth_year: [1966, 1977, 1988, 1999].sample,birth_month: 7,birth_date: 21,profile: "趣味はカラオケです！　レゴランドでバイトしてるので、レゴのことなら何でも聞いてください！",diagnoses_id: 1,tall: 157,weight_type: "小柄",academic: "大学",blood_type: "A型",state: "大阪府",birth_state: "愛知県",brother: "長女",martial_status: "なし",children: "いない",salary: "400~500万",job: "看護師",job_detail: "",academic_status: "卒業",holiday: "土日",check_point: "写真",when_meet: "気が合えば会いたい",cigarette: "吸わない",alcohol: "飲まない")
User.create!(email: "5@m",password: 'pppppppp',sex: 2,first_name: "ゆり子",last_name: "立花",first_kana: "ユリコ",last_kana: "タチバナ",phone_number: 9876543210,birth_year: [1966, 1977, 1988, 1999].sample,birth_month: 2,birth_date: 22,profile: "休みの日はYouTubeを見るか録画したテレビ番組を見ています。",diagnoses_id: 1,tall: 157,weight_type: "ふつう",academic: "大学",blood_type: "A型",state: "京都府",birth_state: "三重県",brother: "長女",martial_status: "なし",children: "いない",salary: "~200万",job: "学生",job_detail: "大学3年生",academic_status: "在学",holiday: "平日",check_point: "価値観",when_meet: "まずは会いたい",cigarette: "時々",alcohol: "時々")
User.create!(email: "17@m",password: 'pppppppp',sex: 2,first_name: "未来",last_name: "梁瀬",first_kana: "ミク",last_kana: "ヤナセ",phone_number: 9876543210,birth_year: [1966, 1977, 1988, 1999].sample,birth_month: 6,birth_date: 18,profile: "趣味はカラオケです！　レゴランドでバイトしてるので、レゴのことなら何でも聞いてください！",diagnoses_id: 1,tall: 157,weight_type: "ふつう",academic: "大学",blood_type: "A型",state: "大阪府",birth_state: "三重県",brother: "三女",martial_status: "なし",children: "いない",salary: "300~400万",job: "保育士",job_detail: "",academic_status: "卒業",holiday: "土日",check_point: "写真",when_meet: "メッセージをしっかり重ねてから",cigarette: "吸わない",alcohol: "飲まない")
User.create!(email: "14@m",password: 'pppppppp',sex: 2,first_name: "あさみ",last_name: "西岡",first_kana: "アサミ",last_kana: "ニシオカ",phone_number: 9876543210,birth_year: [1966, 1977, 1988, 1999].sample,birth_month: 8,birth_date: 17,profile: "趣味はカラオケです！　レゴランドでバイトしてるので、レゴのことなら何でも聞いてください！",diagnoses_id: 1,tall: 157,weight_type: "ふつう",academic: "大学",blood_type: "A型",state: "三重県",birth_state: "三重県",brother: "三女",martial_status: "なし",children: "いない",salary: "~200万",job: "学生",job_detail: "大学2年生",academic_status: "在学",holiday: "土日",check_point: "その他",when_meet: "メッセージをしっかり重ねてから",cigarette: "吸わない",alcohol: "時々")
User.create!(email: "3@m",password: 'pppppppp',sex: 2,first_name: "瞳",last_name: "荒木",first_kana: "ヒトミ",last_kana: "アラキ",phone_number: 9876543210,birth_year: [1966, 1977, 1988, 1999].sample,birth_month: 1,birth_date: 12,profile: "趣味はカラオケです！　レゴランドでバイトしてるので、レゴのことなら何でも聞いてください！",diagnoses_id: 1,tall: 157,weight_type: "太め",academic: "大学",blood_type: "A型",state: "愛知県",birth_state: "愛知県",brother: "三女",martial_status: "なし",children: "いない",salary: "~200万",job: "学生",job_detail: "1年",academic_status: "在学",holiday: "土日",check_point: "プロフィールの充実度",when_meet: "まずは会いたい",cigarette: "吸う",alcohol: "飲む")
User.create!(email: "9@m",password: 'pppppppp',sex: 2,first_name: "奈美",last_name: "寺崎",first_kana: "ナミ",last_kana: "テラサキ",phone_number: 9876543210,birth_year: [1966, 1977, 1988, 1999].sample,birth_month: 6,birth_date: 9,profile: "趣味はカラオケです！　レゴランドでバイトしてるので、レゴのことなら何でも聞いてください！",diagnoses_id: 1,tall: 157,weight_type: "小柄",academic: "大学",blood_type: "B型",state: "静岡県",birth_state: "三重県",brother: "長女",martial_status: "なし",children: "いない",salary: "400~500万",job: "看護師",job_detail: "",academic_status: "卒業",holiday: "平日",check_point: "価値観",when_meet: "気が合えば会いたい",cigarette: "吸う",alcohol: "時々")
User.create!(email: "10@m",password: 'pppppppp',sex: 2,first_name: "涼子",last_name: "関本",first_kana: "リョウコ",last_kana: "セキモト",phone_number: 9876543210,birth_year: [1966, 1977, 1988, 1999].sample,birth_month: 3,birth_date: 25,profile: "趣味はカラオケです！　レゴランドでバイトしてるので、レゴのことなら何でも聞いてください！",diagnoses_id: 1,tall: 157,weight_type: "小柄",academic: "大学",blood_type: "B型",state: "静岡県",birth_state: "愛知県",brother: "長女",martial_status: "なし",children: "いない",salary: "~300~400万",job: "パート",job_detail: "コンビニ店員",academic_status: "卒業",holiday: "土日",check_point: "価値観",when_meet: "気が合えば会いたい",cigarette: "吸わない",alcohol: "時々")
User.create!(email: "12@m",password: 'pppppppp',sex: 2,first_name: "ゆうこ",last_name: "松下",first_kana: "ユウコ",last_kana: "マツシタ",phone_number: 9876543210,birth_year: [1966, 1977, 1988, 1999].sample,birth_month: 1,birth_date: 10,profile: "趣味はカラオケです！　レゴランドでバイトしてるので、レゴのことなら何でも聞いてください！",diagnoses_id: 1,tall: 157,weight_type: "ふつう",academic: "大学",blood_type: "A型",state: "三重県",birth_state: "三重県",brother: "長女",martial_status: "なし",children: "いない",salary: "~300~400万",job: "看護師",job_detail: "",academic_status: "卒業",holiday: "土日",check_point: "写真",when_meet: "気が合えば会いたい",cigarette: "吸わない",alcohol: "時々")


LikesUser.create!(user_id: 1, to_likes_user_id: 2, status: 2)
LikesUser.create!(user_id: 1, to_likes_user_id: 2, status: 2)
LikesUser.create!(user_id: 1, to_likes_user_id: 2, status: 2)


# ChatRoom.create!()

# RoomUser.create!(user_id: 1, chat_room_id: 1)
# RoomUser.create!(user_id: 3, chat_room_id: 1)



# 10.times do |num|
#   User.create!(
#     email: "test#{num}@gmail.com",
#     password: 'pppppppp',
#     sex: [1,2].sample,
#     first_name: "first_#{num}",
#     last_name: "last_#{num}",
#     first_kana: "first_kana#{num}",
#     last_kana: "last_kana#{num}",
#     phone_number: 9876543210,
#     birth_year: [1966, 1977, 1988, 1999].sample,
#     birth_month: 12.times.map{ |m| m + 1 }.sample,
#     birth_date: 29.times.map{ |d| d + 1 }.sample,
#   )
# end

# LikesUser.create!(user_id: 1, to_likes_user_id: 2, status: 2)
