local words = {
	{word = "猫", pronunciation = "neko", meaning = "cat", romaji = "ねこ"},
	{word = "犬", pronunciation = "inu", meaning = "dog", romaji = "いぬ"},
	{word = "水", pronunciation = "mizu", meaning = "water", romaji = "みず"},
	{word = "火", pronunciation = "hi", meaning = "fire", romaji = "ひ"},
	{word = "山", pronunciation = "yama", meaning = "mountain", romaji = "やま"},
	{word = "川", pronunciation = "kawa", meaning = "river", romaji = "かわ"},
	{word = "空", pronunciation = "sora", meaning = "sky", romaji = "そら"},
	{word = "海", pronunciation = "umi", meaning = "sea", romaji = "うみ"},
	{word = "木", pronunciation = "ki", meaning = "tree", romaji = "き"},
	{word = "花", pronunciation = "hana", meaning = "flower", romaji = "はな"},
	{word = "人", pronunciation = "hito", meaning = "person", romaji = "ひと"},
	{word = "日", pronunciation = "hi", meaning = "sun; day", romaji = "ひ"},
	{word = "月", pronunciation = "tsuki", meaning = "moon; month", romaji = "つき"},
	{word = "金", pronunciation = "kane", meaning = "money; gold", romaji = "かね"},
	{word = "雨", pronunciation = "ame", meaning = "rain", romaji = "あめ"},
	{word = "雪", pronunciation = "yuki", meaning = "snow", romaji = "ゆき"},
	{word = "風", pronunciation = "kaze", meaning = "wind", romaji = "かぜ"},
	{word = "食べる", pronunciation = "taberu", meaning = "to eat", romaji = "たべる"},
	{word = "飲む", pronunciation = "nomu", meaning = "to drink", romaji = "のむ"},
	{word = "見る", pronunciation = "miru", meaning = "to see", romaji = "みる"},
	{word = "行く", pronunciation = "iku", meaning = "to go", romaji = "いく"},
	{word = "来る", pronunciation = "kuru", meaning = "to come", romaji = "くる"},
	{word = "書く", pronunciation = "kaku", meaning = "to write", romaji = "かく"},
	{word = "読む", pronunciation = "yomu", meaning = "to read", romaji = "よむ"},
	{word = "聞く", pronunciation = "kiku", meaning = "to listen", romaji = "きく"},
	{word = "話す", pronunciation = "hanasu", meaning = "to speak", romaji = "はなす"},
	{word = "買う", pronunciation = "kau", meaning = "to buy", romaji = "かう"},
	{word = "売る", pronunciation = "uru", meaning = "to sell", romaji = "うる"},
	{word = "楽しい", pronunciation = "tanoshii", meaning = "fun; enjoyable", romaji = "たのしい"},
	{word = "美しい", pronunciation = "utsukushii", meaning = "beautiful", romaji = "うつくしい"},
	{word = "早い", pronunciation = "hayai", meaning = "fast; early", romaji = "はやい"},
	{word = "遅い", pronunciation = "osoi", meaning = "slow; late", romaji = "おそい"},
	{word = "新しい", pronunciation = "atarashii", meaning = "new", romaji = "あたらしい"},
	{word = "古い", pronunciation = "furui", meaning = "old", romaji = "ふるい"},
	{word = "大きい", pronunciation = "ookii", meaning = "big", romaji = "おおきい"},
	{word = "小さい", pronunciation = "chiisai", meaning = "small", romaji = "ちいさい"},
	{word = "暑い", pronunciation = "atsui", meaning = "hot (weather)", romaji = "あつい"},
	{word = "寒い", pronunciation = "samui", meaning = "cold (weather)", romaji = "さむい"},
	{word = "強い", pronunciation = "tsuyoi", meaning = "strong", romaji = "つよい"},
	{word = "弱い", pronunciation = "yowai", meaning = "weak", romaji = "よわい"},
	{word = "赤", pronunciation = "aka", meaning = "red", romaji = "あか"},
	{word = "青", pronunciation = "ao", meaning = "blue", romaji = "あお"},
	{word = "白", pronunciation = "shiro", meaning = "white", romaji = "しろ"},
	{word = "黒", pronunciation = "kuro", meaning = "black", romaji = "くろ"},
	{word = "友達", pronunciation = "tomodachi", meaning = "friend", romaji = "ともだち"},
	{word = "家族", pronunciation = "kazoku", meaning = "family", romaji = "かぞく"},
	{word = "先生", pronunciation = "sensei", meaning = "teacher", romaji = "せんせい"},
	{word = "学生", pronunciation = "gakusei", meaning = "student", romaji = "がくせい"},
	{word = "本", pronunciation = "hon", meaning = "book", romaji = "ほん"},
	{word = "車", pronunciation = "kuruma", meaning = "car", romaji = "くるま"},
	{word = "電車", pronunciation = "densha", meaning = "train", romaji = "でんしゃ"},
	{word = "飛行機", pronunciation = "hikouki", meaning = "airplane", romaji = "ひこうき"},
	{word = "駅", pronunciation = "eki", meaning = "station", romaji = "えき"},
	{word = "道", pronunciation = "michi", meaning = "road", romaji = "みち"},
	{word = "時間", pronunciation = "jikan", meaning = "time", romaji = "じかん"},
	{word = "今", pronunciation = "ima", meaning = "now", romaji = "いま"},
	{word = "昨日", pronunciation = "kinou", meaning = "yesterday", romaji = "きのう"},
	{word = "今日", pronunciation = "kyou", meaning = "today", romaji = "きょう"},
	{word = "明日", pronunciation = "ashita", meaning = "tomorrow", romaji = "あした"},
	{word = "朝", pronunciation = "asa", meaning = "morning", romaji = "あさ"},
	{word = "昼", pronunciation = "hiru", meaning = "noon", romaji = "ひる"},
	{word = "夜", pronunciation = "yoru", meaning = "night", romaji = "よる"},
	{word = "食べ物", pronunciation = "tabemono", meaning = "food", romaji = "たべもの"},
	{word = "飲み物", pronunciation = "nomimono", meaning = "drink", romaji = "のみもの"},
	{word = "魚", pronunciation = "sakana", meaning = "fish", romaji = "さかな"},
	{word = "肉", pronunciation = "niku", meaning = "meat", romaji = "にく"},
	{word = "野菜", pronunciation = "yasai", meaning = "vegetable", romaji = "やさい"},
	{word = "果物", pronunciation = "kudamono", meaning = "fruit", romaji = "くだもの"},
	{word = "天気", pronunciation = "tenki", meaning = "weather", romaji = "てんき"},
	{word = "晴れ", pronunciation = "hare", meaning = "sunny", romaji = "はれ"},
	{word = "曇り", pronunciation = "kumori", meaning = "cloudy", romaji = "くもり"},
	{word = "学校", pronunciation = "gakkou", meaning = "school", romaji = "がっこう"},
	{word = "大学", pronunciation = "daigaku", meaning = "university", romaji = "だいがく"},
	{word = "病院", pronunciation = "byouin", meaning = "hospital", romaji = "びょういん"},
	{word = "店", pronunciation = "mise", meaning = "shop; store", romaji = "みせ"},
	{word = "会社", pronunciation = "kaisha", meaning = "company", romaji = "かいしゃ"},
	{word = "公園", pronunciation = "kouen", meaning = "park", romaji = "こうえん"},
	{word = "図書館", pronunciation = "toshokan", meaning = "library", romaji = "としょかん"},
	{word = "郵便局", pronunciation = "yuubinkyoku", meaning = "post office", romaji = "ゆうびんきょく"},
	{word = "銀行", pronunciation = "ginkou", meaning = "bank", romaji = "ぎんこう"},
	{word = "薬", pronunciation = "kusuri", meaning = "medicine", romaji = "くすり"},
	{word = "先生", pronunciation = "sensei", meaning = "teacher", romaji = "せんせい"},
	{word = "生徒", pronunciation = "seito", meaning = "pupil", romaji = "せいと"},
	{word = "医者", pronunciation = "isha", meaning = "doctor", romaji = "いしゃ"},
	{word = "警察", pronunciation = "keisatsu", meaning = "police", romaji = "けいさつ"},
	{word = "消防士", pronunciation = "shouboushi", meaning = "firefighter", romaji = "しょうぼうし"},
	{word = "料理", pronunciation = "ryouri", meaning = "cooking", romaji = "りょうり"},
	{word = "旅行", pronunciation = "ryokou", meaning = "travel", romaji = "りょこう"},
	{word = "音楽", pronunciation = "ongaku", meaning = "music", romaji = "おんがく"},
	{word = "映画", pronunciation = "eiga", meaning = "movie", romaji = "えいが"},
	{word = "写真", pronunciation = "shashin", meaning = "photograph", romaji = "しゃしん"},
	{word = "誕生日", pronunciation = "tanjoubi", meaning = "birthday", romaji = "たんじょうび"},
	{word = "結婚", pronunciation = "kekkon", meaning = "marriage", romaji = "けっこん"},
	{word = "幸せ", pronunciation = "shiawase", meaning = "happiness", romaji = "しあわせ"},
	{word = "悲しい", pronunciation = "kanashii", meaning = "sad", romaji = "かなしい"},
	{word = "面白い", pronunciation = "omoshiroi", meaning = "interesting", romaji = "おもしろい"},
	{word = "難しい", pronunciation = "muzukashii", meaning = "difficult", romaji = "むずかしい"},
	{word = "家", pronunciation = "ie", meaning = "house", romaji = "いえ"},
	{word = "部屋", pronunciation = "heya", meaning = "room", romaji = "へや"},
	{word = "日本", pronunciation = "Nihon", meaning = "Japan", romaji = "にほん"},
	{word = "お母さん", pronunciation = "okaasan", meaning = "mother", romaji = "おかあさん"},
	{word = "お父さん", pronunciation = "otousan", meaning = "father", romaji = "おとうさん"},
	{word = "子供", pronunciation = "kodomo", meaning = "child", romaji = "こども"},
	{word = "電話", pronunciation = "denwa", meaning = "telephone", romaji = "でんわ"},
	{word = "日本語", pronunciation = "Nihongo", meaning = "Japanese language", romaji = "にほんご"},
	{word = "英語", pronunciation = "Eigo", meaning = "English language", romaji = "えいご"},
	{word = "花火", pronunciation = "hanabi", meaning = "fireworks", romaji = "はなび"},
	{word = "空港", pronunciation = "kuukou", meaning = "airport", romaji = "くうこう"},
	{word = "お金", pronunciation = "okane", meaning = "money", romaji = "おかね"},
	{word = "机", pronunciation = "tsukue", meaning = "desk", romaji = "つくえ"},
	{word = "椅子", pronunciation = "isu", meaning = "chair", romaji = "いす"},
	{word = "パソコン", pronunciation = "pasokon", meaning = "computer", romaji = "ぱそこん"},
	{word = "インターネット", pronunciation = "intaanetto", meaning = "internet", romaji = "いんたーねっと"},
	{word = "鳥", pronunciation = "tori", meaning = "bird", romaji = "とり"},
	{word = "馬", pronunciation = "uma", meaning = "horse", romaji = "うま"},
	{word = "花瓶", pronunciation = "kabin", meaning = "vase", romaji = "かびん"},
	{word = "土", pronunciation = "tsuchi", meaning = "earth; soil", romaji = "つち"},
	{word = "銀", pronunciation = "gin", meaning = "silver", romaji = "ぎん"},
	{word = "石", pronunciation = "ishi", meaning = "stone", romaji = "いし"},
	{word = "湖", pronunciation = "mizūmi", meaning = "lake", romaji = "みずうみ"},
	{word = "天", pronunciation = "ten", meaning = "heaven; sky", romaji = "てん"},
	{word = "雲", pronunciation = "kumo", meaning = "cloud", romaji = "くも"},
	{word = "星", pronunciation = "hoshi", meaning = "star", romaji = "ほし"},
	{word = "太陽", pronunciation = "taiyou", meaning = "sun", romaji = "たいよう"},
	{word = "夕方", pronunciation = "yuugata", meaning = "evening", romaji = "ゆうがた"},
	{word = "午前", pronunciation = "gozen", meaning = "morning; a.m.", romaji = "ごぜん"},
	{word = "午後", pronunciation = "gogo", meaning = "afternoon; p.m.", romaji = "ごご"},
	{word = "時計", pronunciation = "tokei", meaning = "clock; watch", romaji = "とけい"},
	{word = "日曜日", pronunciation = "nichiyoubi", meaning = "Sunday", romaji = "にちようび"},
	{word = "月曜日", pronunciation = "getsuyoubi", meaning = "Monday", romaji = "げつようび"},
	{word = "火曜日", pronunciation = "kayoubi", meaning = "Tuesday", romaji = "かようび"},
	{word = "水曜日", pronunciation = "suiyoubi", meaning = "Wednesday", romaji = "すいようび"},
	{word = "木曜日", pronunciation = "mokuyoubi", meaning = "Thursday", romaji = "もくようび"},
	{word = "金曜日", pronunciation = "kinyoubi", meaning = "Friday", romaji = "きんようび"},
	{word = "土曜日", pronunciation = "doyoubi", meaning = "Saturday", romaji = "どようび"},
	{word = "週末", pronunciation = "shuumatsu", meaning = "weekend", romaji = "しゅうまつ"},
	{word = "今年", pronunciation = "kotoshi", meaning = "this year", romaji = "ことし"},
	{word = "去年", pronunciation = "kyonen", meaning = "last year", romaji = "きょねん"},
	{word = "来年", pronunciation = "rainen", meaning = "next year", romaji = "らいねん"},
	{word = "春", pronunciation = "haru", meaning = "spring", romaji = "はる"},
	{word = "夏", pronunciation = "natsu", meaning = "summer", romaji = "なつ"},
	{word = "秋", pronunciation = "aki", meaning = "autumn", romaji = "あき"},
	{word = "冬", pronunciation = "fuyu", meaning = "winter", romaji = "ふゆ"},
	{word = "春休み", pronunciation = "haruyasumi", meaning = "spring vacation", romaji = "はるやすみ"},
	{word = "夏休み", pronunciation = "natsuyasumi", meaning = "summer vacation", romaji = "なつやすみ"},
	{word = "冬休み", pronunciation = "fuyuyasumi", meaning = "winter vacation", romaji = "ふゆやすみ"},
	{word = "自転車", pronunciation = "jitensha", meaning = "bicycle", romaji = "じてんしゃ"},
	{word = "バス", pronunciation = "basu", meaning = "bus", romaji = "ばす"},
	{word = "歩く", pronunciation = "aruku", meaning = "to walk", romaji = "あるく"},
	{word = "走る", pronunciation = "hashiru", meaning = "to run", romaji = "はしる"},
	{word = "飛ぶ", pronunciation = "tobu", meaning = "to fly", romaji = "とぶ"},
	{word = "立つ", pronunciation = "tatsu", meaning = "to stand", romaji = "たつ"},
	{word = "座る", pronunciation = "suwaru", meaning = "to sit", romaji = "すわる"},
	{word = "寝る", pronunciation = "neru", meaning = "to sleep", romaji = "ねる"},
	{word = "起きる", pronunciation = "okiru", meaning = "to wake up", romaji = "おきる"},
	{word = "勉強する", pronunciation = "benkyou suru", meaning = "to study", romaji = "べんきょうする"},
	{word = "働く", pronunciation = "hataraku", meaning = "to work", romaji = "はたらく"},
	{word = "休む", pronunciation = "yasumu", meaning = "to rest; to be absent", romaji = "やすむ"},
	{word = "歌う", pronunciation = "utau", meaning = "to sing", romaji = "うたう"},
	{word = "踊る", pronunciation = "odoru", meaning = "to dance", romaji = "おどる"},
	{word = "泳ぐ", pronunciation = "oyogu", meaning = "to swim", romaji = "およぐ"},
	{word = "笑う", pronunciation = "warau", meaning = "to laugh", romaji = "わらう"},
	{word = "泣く", pronunciation = "naku", meaning = "to cry", romaji = "なく"},
	{word = "怒る", pronunciation = "okoru", meaning = "to get angry", romaji = "おこる"},
	{word = "驚く", pronunciation = "odoroku", meaning = "to be surprised", romaji = "おどろく"},
	{word = "思う", pronunciation = "omou", meaning = "to think", romaji = "おもう"},
	{word = "知る", pronunciation = "shiru", meaning = "to know", romaji = "しる"},
	{word = "忘れる", pronunciation = "wasureru", meaning = "to forget", romaji = "わすれる"},
	{word = "覚える", pronunciation = "oboeru", meaning = "to remember", romaji = "おぼえる"},
	{word = "笑顔", pronunciation = "egao", meaning = "smile", romaji = "えがお"},
	{word = "夢", pronunciation = "yume", meaning = "dream", romaji = "ゆめ"},
	{word = "未来", pronunciation = "mirai", meaning = "future", romaji = "みらい"},
	{word = "過去", pronunciation = "kako", meaning = "past", romaji = "かこ"},
	{word = "現在", pronunciation = "genzai", meaning = "present; now", romaji = "げんざい"},
	{word = "自分", pronunciation = "jibun", meaning = "oneself", romaji = "じぶん"},
	{word = "世界", pronunciation = "sekai", meaning = "world", romaji = "せかい"},
	{word = "国", pronunciation = "kuni", meaning = "country", romaji = "くに"},
	{word = "都市", pronunciation = "toshi", meaning = "city", romaji = "とし"},
	{word = "村", pronunciation = "mura", meaning = "village", romaji = "むら"},
	{word = "町", pronunciation = "machi", meaning = "town", romaji = "まち"},
	{word = "通り", pronunciation = "toori", meaning = "street", romaji = "とおり"},
	{word = "心", pronunciation = "kokoro", meaning = "heart; mind", romaji = "こころ"},
	{word = "身体", pronunciation = "karada", meaning = "body", romaji = "からだ"},
	{word = "頭", pronunciation = "atama", meaning = "head", romaji = "あたま"},
	{word = "目", pronunciation = "me", meaning = "eye", romaji = "め"},
	{word = "耳", pronunciation = "mimi", meaning = "ear", romaji = "みみ"},
	{word = "口", pronunciation = "kuchi", meaning = "mouth", romaji = "くち"},
	{word = "手", pronunciation = "te", meaning = "hand", romaji = "て"},
	{word = "足", pronunciation = "ashi", meaning = "foot; leg", romaji = "あし"},
	{word = "腕", pronunciation = "ude", meaning = "arm", romaji = "うで"},
	{word = "指", pronunciation = "yubi", meaning = "finger", romaji = "ゆび"},
	{word = "背中", pronunciation = "senaka", meaning = "back", romaji = "せなか"},
	{word = "心臓", pronunciation = "shinzou", meaning = "heart (organ)", romaji = "しんぞう"},
	{word = "風邪", pronunciation = "kaze", meaning = "cold (illness)", romaji = "かぜ"},
	{word = "病気", pronunciation = "byouki", meaning = "illness", romaji = "びょうき"},
	{word = "嬉しい", pronunciation = "ureshii", meaning = "happy; glad", romaji = "うれしい"},
	{word = "怖い", pronunciation = "kowai", meaning = "scary", romaji = "こわい"},
	{word = "冷たい", pronunciation = "tsumetai", meaning = "cold (to touch)", romaji = "つめたい"},
	{word = "暖かい", pronunciation = "atatakai", meaning = "warm", romaji = "あたたかい"},
	{word = "熱い", pronunciation = "atsui", meaning = "hot (to touch)", romaji = "あつい"},
	{word = "易しい", pronunciation = "yasashii", meaning = "easy", romaji = "やさしい"},
	{word = "黄色", pronunciation = "kiiro", meaning = "yellow", romaji = "きいろ"},
	{word = "緑", pronunciation = "midori", meaning = "green", romaji = "みどり"},
	{word = "茶色", pronunciation = "chairo", meaning = "brown", romaji = "ちゃいろ"},
	{word = "紫", pronunciation = "murasaki", meaning = "purple", romaji = "むらさき"},
	{word = "ピンク", pronunciation = "pinku", meaning = "pink", romaji = "ぴんく"},
	{word = "オレンジ", pronunciation = "orenji", meaning = "orange (color)", romaji = "おれんじ"},
	{word = "灰色", pronunciation = "haiiro", meaning = "gray", romaji = "はいいろ"},
	{word = "金色", pronunciation = "kin'iro", meaning = "gold (color)", romaji = "きんいろ"},
	{word = "銀色", pronunciation = "giniro", meaning = "silver (color)", romaji = "ぎんいろ"},
	{word = "一", pronunciation = "ichi", meaning = "one", romaji = "いち"},
	{word = "二", pronunciation = "ni", meaning = "two", romaji = "に"},
	{word = "三", pronunciation = "san", meaning = "three", romaji = "さん"},
	{word = "四", pronunciation = "yon", meaning = "four", romaji = "よん"},
	{word = "五", pronunciation = "go", meaning = "five", romaji = "ご"},
	{word = "六", pronunciation = "roku", meaning = "six", romaji = "ろく"},
	{word = "七", pronunciation = "nana", meaning = "seven", romaji = "なな"},
	{word = "八", pronunciation = "hachi", meaning = "eight", romaji = "はち"},
	{word = "九", pronunciation = "kyuu", meaning = "nine", romaji = "きゅう"},
	{word = "十", pronunciation = "juu", meaning = "ten", romaji = "じゅう"},
	{word = "百", pronunciation = "hyaku", meaning = "hundred", romaji = "ひゃく"},
	{word = "千", pronunciation = "sen", meaning = "thousand", romaji = "せん"},
	{word = "万", pronunciation = "man", meaning = "ten thousand", romaji = "まん"},
	{word = "朝ご飯", pronunciation = "asagohan", meaning = "breakfast", romaji = "あさごはん"},
	{word = "昼ご飯", pronunciation = "hirugohan", meaning = "lunch", romaji = "ひるごはん"},
	{word = "夕ご飯", pronunciation = "yuugohan", meaning = "dinner", romaji = "ゆうごはん"},
	{word = "ご飯", pronunciation = "gohan", meaning = "rice; meal", romaji = "ごはん"},
	{word = "パン", pronunciation = "pan", meaning = "bread", romaji = "ぱん"},
	{word = "牛乳", pronunciation = "gyuunyuu", meaning = "milk", romaji = "ぎゅうにゅう"},
	{word = "コーヒー", pronunciation = "koohii", meaning = "coffee", romaji = "こーひー"},
	{word = "お茶", pronunciation = "ocha", meaning = "tea", romaji = "おちゃ"},
	{word = "お酒", pronunciation = "osake", meaning = "alcohol; sake", romaji = "おさけ"},
	{word = "砂糖", pronunciation = "satou", meaning = "sugar", romaji = "さとう"},
	{word = "塩", pronunciation = "shio", meaning = "salt", romaji = "しお"},
	{word = "醤油", pronunciation = "shouyu", meaning = "soy sauce", romaji = "しょうゆ"},
	{word = "味噌", pronunciation = "miso", meaning = "miso", romaji = "みそ"},
	{word = "愛", pronunciation = "ai", meaning = "love", romaji = "あい"},
	{word = "夢", pronunciation = "yume", meaning = "dream", romaji = "ゆめ"},
	{word = "希望", pronunciation = "kibou", meaning = "hope", romaji = "きぼう"},
	{word = "平和", pronunciation = "heiwa", meaning = "peace", romaji = "へいわ"},
	{word = "自由", pronunciation = "jiyuu", meaning = "freedom", romaji = "じゆう"},
	{word = "正義", pronunciation = "seigi", meaning = "justice", romaji = "せいぎ"},
	{word = "勇気", pronunciation = "yuuki", meaning = "courage", romaji = "ゆうき"},
	{word = "努力", pronunciation = "doryoku", meaning = "effort", romaji = "どりょく"},
	{word = "成功", pronunciation = "seikou", meaning = "success", romaji = "せいこう"},
	{word = "失敗", pronunciation = "shippai", meaning = "failure", romaji = "しっぱい"},
	{word = "挑戦", pronunciation = "chousen", meaning = "challenge", romaji = "ちょうせん"},
	{word = "目標", pronunciation = "mokuhyou", meaning = "goal", romaji = "もくひょう"},
	{word = "計画", pronunciation = "keikaku", meaning = "plan", romaji = "けいかく"},
	{word = "変化", pronunciation = "henka", meaning = "change", romaji = "へんか"},
	{word = "発展", pronunciation = "hattatsu", meaning = "development", romaji = "はったつ"},
	{word = "文化", pronunciation = "bunka", meaning = "culture", romaji = "ぶんか"},
	{word = "歴史", pronunciation = "rekishi", meaning = "history", romaji = "れきし"},
	{word = "伝統", pronunciation = "dentou", meaning = "tradition", romaji = "でんとう"},
	{word = "芸術", pronunciation = "geijutsu", meaning = "art", romaji = "げいじゅつ"},
	{word = "科学", pronunciation = "kagaku", meaning = "science", romaji = "かがく"},
	{word = "技術", pronunciation = "gijutsu", meaning = "technology", romaji = "ぎじゅつ"},
	{word = "経済", pronunciation = "keizai", meaning = "economy", romaji = "けいざい"},
	{word = "政治", pronunciation = "seiji", meaning = "politics", romaji = "せいじ"},
	{word = "社会", pronunciation = "shakai", meaning = "society", romaji = "しゃかい"},
	{word = "環境", pronunciation = "kankyou", meaning = "environment", romaji = "かんきょう"},
	{word = "自然", pronunciation = "shizen", meaning = "nature", romaji = "しぜん"},
	{word = "生命", pronunciation = "seimei", meaning = "life", romaji = "せいめい"},
	{word = "宇宙", pronunciation = "uchuu", meaning = "universe", romaji = "うちゅう"},
	{word = "地球", pronunciation = "chikyuu", meaning = "earth", romaji = "ちきゅう"},
	{word = "太陽系", pronunciation = "taiyoukei", meaning = "solar system", romaji = "たいようけい"},
	{word = "銀河系", pronunciation = "gingakei", meaning = "Milky Way galaxy", romaji = "ぎんがけい"},
	{word = "星雲", pronunciation = "seigun", meaning = "nebula", romaji = "せいうん"},
	{word = "ブラックホール", pronunciation = "burakkuhooru", meaning = "black hole", romaji = "ぶらくくほーる"},
	{word = "月面", pronunciation = "getsumei", meaning = "moon surface", romaji = "げつめん"},
	{word = "惑星", pronunciation = "wakusei", meaning = "planet", romaji = "わくせい"},
	{word = "衛星", pronunciation = "eisei", meaning = "satellite", romaji = "えいせい"},
	{word = "彗星", pronunciation = "suisei", meaning = "comet", romaji = "すいせい"},
	{word = "流星", pronunciation = "ryuusei", meaning = "meteor", romaji = "りゅうせい"},
	{word = "星座", pronunciation = "seiza", meaning = "constellation", romaji = "せいざ"},
	{word = "光", pronunciation = "hikari", meaning = "light", romaji = "ひかり"},
	{word = "影", pronunciation = "kage", meaning = "shadow", romaji = "かげ"},
	{word = "温度", pronunciation = "ondo", meaning = "temperature", romaji = "おんど"},
	{word = "湿度", pronunciation = "shitsu do", meaning = "humidity", romaji = "しつど"},
	{word = "雨雲", pronunciation = "amagumo", meaning = "rain cloud", romaji = "あマグモ"},
	{word = "雷", pronunciation = "kaminari", meaning = "thunder", romaji = "かみなり"},
	{word = "虹", pronunciation = "niji", meaning = "rainbow", romaji = "にじ"},
	{word = "風力", pronunciation = "fuuryoku", meaning = "wind force", romaji = "ふうりょく"},
	{word = "台風", pronunciation = "taifuu", meaning = "typhoon", romaji = "たいふう"},
	{word = "地震", pronunciation = "jishin", meaning = "earthquake", romaji = "じしん"},
	{word = "火山", pronunciation = "kazan", meaning = "volcano", romaji = "かざん"},
	{word = "噴火", pronunciation = "funka", meaning = "eruption", romaji = "ふんか"},
	{word = "津波", pronunciation = "tsunami", meaning = "tsunami", romaji = "つなみ"},
	{word = "洪水", pronunciation = "kouzui", meaning = "flood", romaji = "こうずい"},
	{word = "干ばつ", pronunciation = "kanbatsu", meaning = "drought", romaji = "かんばつ"},
	{word = "嵐", pronunciation = "arashi", meaning = "storm", romaji = "あらし"},
	{word = "雪崩", pronunciation = "naware", meaning = "avalanche", romaji = "なわれ"},
	{word = "砂漠", pronunciation = "sabaku", meaning = "desert", romaji = "さばく"},
	{word = "森林", pronunciation = "shinrin", meaning = "forest", romaji = "しんりん"},
	{word = "草原", pronunciation = "sougen", meaning = "grassland", romaji = "そうげん"},
	{word = "山脈", pronunciation = "sanmyaku", meaning = "mountain range", romaji = "さんみゃく"},
	{word = "谷", pronunciation = "tani", meaning = "valley", romaji = "たに"},
	{word = "川", pronunciation = "kawa", meaning = "river", romaji = "かわ"},
	{word = "湖", pronunciation = "mizūmi", meaning = "lake", romaji = "みずうみ"},
	{word = "海峡", pronunciation = "kaikyo", meaning = "strait", romaji = "かいきょう"},
	{word = "島", pronunciation = "shima", meaning = "island", romaji = "しま"},
	{word = "大陸", pronunciation = "tairiku", meaning = "continent", romaji = "たいりく"},
	{word = "地図", pronunciation = "chizu", meaning = "map", romaji = "ちず"}
}

return words
