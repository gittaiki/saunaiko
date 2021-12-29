entry_youtube_ids = [
  # 東海サウナ部にてつやが体験入部してきました
  'DTL3DShbKhc',
  # サウナーゆうこす、サウナの入り方&愛を語ります【VLOG】
  'yiUP6-OQbqo',
  # 藤森慎吾＆はじめしゃちょー＆おばたのお兄さん前編
  'CIXSwK2Ap0A',
  # 藤森慎吾＆はじめしゃちょー＆おばたのお兄さん後編
  '1MkEhopnmWE'
]

basic_youtube_ids = [
  # はじめしゃちょーのサウナの整い方。
  'w1pWFesqPvA',
  # 安田美沙子さんとサウナ！千葉・船橋G-topia 初ととのえの瞬間を見て！
  '58OZ5pBhKLo',
  # 【検証】1週間毎日サウナに通い続けたら体にどんな変化が起きるのか？【縛り生活】
  'ozWEydEg3r0',
  # アルピー酒井が徹底解説「かるまる池袋」の楽しみ方
  'm4HBXCoLSR0'
]

advanced_youtube_ids = [
  # ロンブー淳とかるまる
  'iTSsv7AZ8dw',
  # アルピーとテルマー湯
  '_sgLjNF7ROA',
  # アルピーとおふろの国
  '36wrnwpvKPU',
  # サウナ修学旅行in神奈川 ハマ熱波で大ピンチ⁉︎おふろの国
  '3o1OtZmn438',
  # ゴリラグース&MADMAX水風呂をガチ体験♡熊本 湯らっくす
  'YqbNN1v7Ss0',
  # 杉浦太陽さん初ととのい！in 千葉・館山「Sea Sauna Shack」
  'gSVETgZWOmE'
]

entry_youtube_ids.each do |youtube_id|
  Video.seed(:youtube_id) do |s|
    s.youtube_id = youtube_id
    s.level = 'entry'
  end
end

basic_youtube_ids.each do |youtube_id|
  Video.seed(:youtube_id) do |s|
    s.youtube_id = youtube_id
    s.level = 'basic'
  end
end

advanced_youtube_ids.each do |youtube_id|
  Video.seed(:youtube_id) do |s|
    s.youtube_id = youtube_id
    s.level = 'advanced'
  end
end
