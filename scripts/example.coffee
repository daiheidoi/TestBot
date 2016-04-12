# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

child_process = require 'child_process'

ramens = [
  "http://tabelog.com/tokyo/A1304/A130401/13182184/",
  "http://tabelog.com/tokyo/A1304/A130401/13040181/",
  "http://tabelog.com/tokyo/A1304/A130401/13006892/",
  "http://tabelog.com/tokyo/A1304/A130401/13104460/",
  "http://tabelog.com/tokyo/A1304/A130401/13141446/",
  "http://tabelog.com/tokyo/A1304/A130401/13066030/",
  "http://tabelog.com/tokyo/A1304/A130401/13156913/",
  "http://tabelog.com/tokyo/A1304/A130401/13022300/",
  "http://tabelog.com/tokyo/A1304/A130401/13001055/"
]

hikipedia = [
  """
```
青春とは嘘であり、悪である。
青春を謳歌せし者たちは常に自己と周囲を欺き自らを取り巻く環境
を肯定的にとらえる。
彼らは青春の二文字の前ならば、どんな一般的な解釈も社会通念も
捻じ曲げてみせる。
彼らにかかれば嘘も秘密も罪科も失敗さえも、青春のスパイスでし
かないのだ。
仮に失敗することが青春の証であるのなら友達作りに失敗した人間
もまた青春のド真ん中でなければおかしいではないか。
しかし、彼らはそれを認めないだろう。
すべては彼らのご都合主義でしかない。結論を言おう。
青春を楽しむ愚か者ども、
砕け散れ。
```
  """,
  """
```
動物は基本、群れるものである。
肉食獣にはヒエラルキーがありボスになれなければ死ぬまでストレ
スを抱え続ける。草食動物も天敵の襲撃で仲間を犠牲にして生き
続けることにジレンマを感じているはずだ。このように群れとは
個にとってなんら益をもたらさないのだ。ならば私は、
決して群れることのない熊の道を選ぶ。
熊とは一頭で生きていくことに何の不安も感じていない孤高の動物
だ。しかも冬眠ができる。なんと素晴らしいことか。
次に生まれ変わるなら私は絶対、
熊になりたい。
```
  """,
  """
```
古人曰く、働いたら負けである。
労働とはリスクを払いリターンを得る行為である。よって俺の働か
ずに家庭に入るという選択肢は妥当であり、かつまったくもって正
当なものである。
従って今回の職場見学においては専業主夫にとって職場である自宅
を希望する。
```
  """,
  """
```
でた、必殺技「ザ・ZONE」
説明しよう、「ザ・ZONE」とは真にリアルが充実した者のみが持
ちうる固有スキルでその最大の特徴は場を整えることにある。彼ら
は現実世界が充実しているため見下されがちな者に対しても優し
い。カリスマ性を有するいい人が持つ独特の空気感と呼べるだろ
う。
```
  """,
  """
```
俺は優しい女の子は嫌いだ。
ほんの一言挨拶を交わせば気になるし、メールが行き交えば心がざ
わつく。電話なんか掛かってきた日には着信履歴を見てつい頬が緩
む。
だが知っている、それが優しさだということを。
俺に優しい人間は他の人にも優しくて、その事をつい忘れてしまい
そうになる。
真実は残酷だというのなら、きっと嘘は優しいのだろう。
だから優しさは嘘だ。
いつだって期待して、いつも勘違いして、いつからか希望を持つの
はやめた。
訓練されたボッチは二度も同じ手に引っ掛かったりしない。
百戦錬磨の強者。負けることに関しては俺が最強。
だからいつまでも
優しい女の子は・・・嫌いだ。
```
  """,
  """
```
俺がすげえっつってんのはあの何？強化外骨格みたいな外面だよ。
人当たりが良くて、ずっとニコニコしてて、優しく話しかけてくれ
る。まさに男の理想だわな。でも理想は理想だ、現実じゃあない。
だからどこか嘘くさい。
```
  """,
  """
```
問題の本質を理解していない。
孤立すること、一人でいること自体は別にいいんだ。
問題なのは悪意によって孤立させられていることだ。
```
  """,
  """
```
自分が変われば世界が変わるというが、そんなことはない。
人が人を評価するのは固定観念と印象だ。
ぼっちはぼっちであることを強要される。
何かを頑張って目立てば、攻撃の材料にされるだけ。
それが子供の王国の腐りきったルール。

問題：世界は変わりません。自分は変えられます。
　　　さて、どう変わりますか？
答え：新世界の神になる
```
  """,
  """
```
人間本当に怖い思いをしたら、人のことなんて考えていられない。
周りの人間を犠牲にしてでも助かろうとしたがる。
そんな醜い部分をさらしたら、もう仲良くなんてできない。
そうやってバラバラにしてやればいい。
逃げちゃダメなんて強者の考え方でしかない。
いつも自分が悪いなんて事はない。社会が、世の中が、周囲が、誰
かが間違っていることだってたくさんある。
自分は変えられる、なんてのは、そのゴミみたいな冷淡で残酷な世
界に順応して負けを認めて隷属する行為だ。
綺麗な言葉で飾って自分すら騙している欺瞞に過ぎない。
```
  """,
  """
```
誰かを頼る、みんなで助け合う、支え合うっていうのは一般的には
正しい事この上ない。
でも理想論だ。必ず誰かが貧乏くじを引く。
```
  """,
  """
```
自分が変われば世界が変わるというは嘘だ。
　都合のいい嘘を押し付けられて妥協させられているだけだ。
```
  """,
  """
```
人という字は人と人とが支え合って、とか言ってますけど
片方寄りかかってんじゃないですか。
誰か犠牲になることを容認してるのが人って概念だと思うんですよね
```
  """,
  """
```
参加することに意義がある。
近代オリンピックの父、ピエール・ド・クーベルタン男爵が演説で
取り上げ広く知られた言葉だが、この言葉はしばしば誤用され強制
参加の為の脅迫文句となっている節がある。
世の中、行くだけ無駄だったなんてものは腐るほどあるだろうに。
参加することに意義があるのなら参加しない勢力に参加することに
も意義があるはずであり、何事も経験というのであれば経験をしな
い経験にだって価値はあるはずだ。
むしろ誰もが経験することをしないというのはむしろ貴重といえる。
俺は悪くない、社会が悪い。
```
  """,
  """
```
結婚、それは人生の墓場だ。
既婚者は例外なく、その素晴らしさを誇らしげに語る。
やれただいまを言う相手がいると嬉しいだの、
子供の寝顔を見ると明日も頑張れるだの。
　
だが、ちょっと待ってほしい。
実家に居てもただいまは言えるし
なんなら、うがい薬でも買ってカバにただいまを言えばいい。
それに子供の寝顔を見るってことは残業地獄という事だ。
それが本当に幸福であると言えるだろうか。
幸せを説いているはずの彼らの目は俺同様、腐っていて
まるで人を沼地に取り込むゾンビのようだ。
　
育ってきた環境が違うのであれば好き嫌いがあるのも否めない。
故に、結婚が必ずしも幸せとは限らないのではないだろうか。
```
  """,
  """
```
最終的にこれはもうあれだな、結婚しなくても妹がいればいいん
じゃないの。メーカーは本体とか円盤同梱するなら妹同梱しろよ
絶対売れるぞ。
```
  """,
  """
```
あれは社会生活の模倣なんだよ。
上司と出張に行けば、泊まる所も晩飯のメニューも
自分じゃ選べねぇ。でも妥協すればそれなりに楽しいんだって、
自分を騙すための訓練みたいなもんだ。
```
  """,
  """
```
何かを守るために、いくつも犠牲にするくらいなら
諦めて捨ててしまうのだろう。今、手にしている関係さえも。
```
  """,
  """
```
大事だから。失いたくないから。
隠して、装って、だから誰もが嘘をつく。
```
  """,
]

module.exports = (robot) ->
  robot.respond /(うんこ|うんち)$/i, (msg) ->
    msg.send "ぶりーーーーーーっ :poop: :poop: :poop: :poop: "

  robot.respond /:kaoringo:$/i, (msg) ->
    text = "顔、りんごやん :kaoringo:"
    msg.send text 

  robot.respond /比企ペディア$/i, (msg) ->
    msg.send msg.random hikipedia

  robot.hear /【朗報】+(.*)$/i, (msg) ->
    msg.send "`【朗報】" + msg.match[1] + "`" + "\n" + "大事なことなので2回言いますた。"

  robot.hear /【吉報】+(.*)$/i, (msg) ->
    msg.send "`【吉報】" + msg.match[1] + "`" + "\n" + "大事なことなので2回言いますた。"

  robot.hear /【悲報】+(.*)$/i, (msg) ->
    msg.send "`【悲報】" + msg.match[1] + "`" + "\n" + "2倍悲しいですが、\n" + "大事なことなので2回言いますた。"

  robot.hear /(.*)+(;|；|><|＞＜)+(.*)$/i, (msg) ->
    msg.send """
```
　　 _, ,_
　　(　ﾟДﾟ) 　
　　(　 ∩ミ　　駄目だこいつ
　 　|　ωつ☆    早くなんとかしないと・・・・・・
　 　し ⌒Ｊ　|
```
    """

  robot.respond /:kaoringo:\s+bomb\s+(\S+)$/i, (msg) ->
    cnt = msg.match[1]
    text = "めっちゃ顔、りんごやん"
    for i in [0..cnt]
      if i % 10 == 0 then text += "\n"
      text += ":kaoringo: "
    msg.send text

  robot.respond /:buncho:\s+bomb\s+(\S+)$/i, (msg) ->
    cnt = msg.match[1]
    text = "めっちゃ和田さんの鳥やん"
    for i in [0..cnt]
      if i % 10 == 0 then text += "\n"
      text += ":buncho: "
    msg.send text

  robot.respond /:kaoringo: :iwanami:$/i, (msg) ->
    text = "これが夢のコラボや！"
    iwanami = ":iwanami: "
    kaoringo = ":kaoringo: "
    okiba = ""
    for i in [0..499]
      if i % 50 == 0 then text += "\n"
      if i % 50 == 0 then okiba = iwanami
      if i % 50 == 0 then iwanami = kaoringo
      if i % 50 == 0 then kaoringo = okiba
      if i % 2 == 0 then text += iwanami
      if i % 2 == 1 then text += kaoringo
    msg.send text

  robot.respond /タバコ$/i, (msg) ->
    msg.send """
```
　　 ／￣￣＼ 
　 ／　 _ノ　　＼ 
　|　　（ ●）（●） 
.　|　　 （__人__）　  ＼ 
　 |　　　　｀ ⌒ﾉ　　 　  ＼ 
. ヽ　 　　　 　} 　　 　 　＼ . ...:::,, 
　　 ヽ　　　　ノ　　　　　 　,）:::::::ノ　. 
　　　/　　　 く　　＼　　　　（:::::ソ:　. 
　　　|　　　　 ＼　　＼ 　 ,ノノ　＼ 
　 　 |　　　　|ヽ、二⌒) ━Ц　　 　  ＼ 
```
  """

 # robot.respond /wiki (.*)$/i, (msg) -> 
  #  msg.send "http://ja.wikipedia.org/wiki/#{msg.match[1]}"

 #  robot.http("https://ja.wikipedia.org/wiki/" + msg.match[1])
 #   .get() (err, res, body) ->

 # robot.respond /i (.*)$/i, (msg) -> 
 #   request = require('request');
 #   request.get("http://images.google.co.jp/images?hl=ja&source=hp&q=#{msg.match[1]}, (error, response, body) ->
 #     if response.statusCode isnt 200
 #       res.send "画像検索失敗しました..."
 #       return

 #     msg.send body

 #     element = body.getElementByClassName("rg_l");
 #     attr = element.getAttribute("href");
 #     message = attr.replace("https://www.google.co.jp/imgres?imgurl=", "")
 #     msg.send message )
      
  robot.respond /クラブ$/i, (msg) -> 
    msg.send "http://t2-shibuya.com/club/"

  robot.hear /(ちんこ|ちんぽ|ちんぽこ|ちんぽこ丸|ちんこ林)$/i, (msg) ->
    msg.send """
```
　　　　　　　　　　　　　　_i⌒r-.、　　　　 
　　　　　　　　　　　,,-'´　　　ノ 
　　　　　　　　　　./　　　　　.l 
　　　　　　　　　 /　　　　　　 l　　　　　チ 
　　　((　 ◯　　.ｌ　　　　　　　 l　　　　　ン 
　　　　　 .ヽヽ、l　 i　　　　　 .l　　　　　 ポ 
　　　　　　　＼ヽ　l　　　　　　l　　　))　 コ 
　　　　　 ,-'´￣｀ゝ´￣｀ヽ　 ﾉl　　　　　 ポ 
　　 　 .,'　　　 .,'　　　◯ニ.ンl　　　　　 .ン 
　　　　 i　　　　i　　　　　　　 .i 
　　　　 ヽ、　　丶　　　　　 .ノ 
　　　　　　｀'ー-.'´｀'ー- ''´i .| 
　　　　　　　　凵　　　　　 .凵
```
  """

  robot.hear /昼飯どうする？$/i, (msg) ->
    msg.send "ラーメン一択やろ！\n" + msg.random ramens

  robot.respond /:iwanami:$/i, (msg) ->
    msg.send """
```
　　　　　　　　　,r"´⌒｀ﾞ`ヽ
　　　　　　　／　,　　　-‐- !､
　　　 　　／　{,}f　　-‐- ,,,__､)
　　　　／　　 /　　.r'~"''‐--､)
　　,r''"´⌒ヽ{　　 ヽ　(・)ﾊ(・)}､
　/　　　　　　＼　　（⊂｀-'つ）i-､
　　　　　　　　　 `}. （__,,ノヽ_ﾉ,ﾉ　 ＼ ウホっ
　　　　　　　　　　 l　　 ｀-" ,ﾉ　　　 ヽ
　　　　　　　　　　 }　､､___,j''　　　　　 l
```
  """

  robot.respond /:iwanami: タバコ$/i, (msg) ->
    msg.send """
```
　　　　　　　　　,r"´⌒｀ﾞ`ヽ
　　　　　　　／　,　　　-‐- !､　　　　　　　
　　　 　　／　{,}f　　-‐- ,,,__､)    (　　, ;:       
　　　　／　　 /　　.r'~"''‐--､)      )　. ;;:     
　　,r''"´⌒ヽ{　　 ヽ　(・)ﾊ(・)}､　　　(　；;ﾉ　　　　
　/　　　　　　＼　　（⊂｀-'つ）i-､　　   )__ｿ
　　　　　　　　　 `}. （__,,ノヽ_ﾉ,ﾉ＿__| 
　　　　　　　　　　 l　　 ｀-" ,ﾉ　　　 ヽ
　　　　　　　　　　 }　､､___,j''　　　　　 l
```
  """

  robot.respond /おっぱい$/i, (msg) ->
    msg.send """
```
　　　　　　　　　　　おっぱい！
　　　　　　　おっぱい！　おっぱい！
　　　　おっぱい　おっぱい！　おっぱい！
　　おっぱい！　∩　　　∩　ﾉ)　　　おっぱい！
　おっぱい！　　川　∩ 川彡'三つ　　おっぱい！
おっぱい！　⊂ミ∩､⊂ミ∩彡⊃　　　　おっぱい！
おっぱい！⊂三ミ(　ﾟ∀ﾟ)彡三彡三⊃　おっぱい！
おっぱい！　⊂彡川⊂彡川ミ⊃　　　　おっぱい！
おっぱい！⊂彡川∪⊃ Ｕ川彡⊃　　　おっぱい！
　おっぱい！　(ノ ∪　　川　∪ミ)　　おっぱい！
　　おっぱい！　　　　　 ∪ 　　　　おっぱい！
　　　　おっぱい！　おっぱい！　おっぱい！
　　　　　　　　おっぱい！　おっぱい！
　　　　　　　　　　　　おっぱい！
```
  """

  robot.respond /ちんちん$/i, (msg) ->
    msg.send """
```
　　(　ﾟ∀ﾟ)　ちんちん! ちんちん!
　　(　 　　)
　 　|　彡つ
　 　し∪Ｊ
　　　_　_
　　(　ﾟ∀ﾟ)
　　(　 ∩ミ　　ﾌﾞﾝﾌﾞﾝ
　 　|　ωつ,ﾞ
　 　し ⌒Ｊ

おっぱ・・・
　　 _, ,_
　　(　ﾟДﾟ) 　ｶﾞﾝ!!
　　(　 ∩ミ　＿＿＿＿
　 　|　ωつ☆
　 　し ⌒Ｊ　|


```
  """

  robot.respond /エヴァ\s+(.+)$/i, (msg) ->
    nanwa = msg.match[1]
    text = ""
    switch nanwa
      when "1"
        text = """
```
第壱話 
  使
  徒、襲来
```
        """
      when "2"
        text = """
```
第弐話 見
      知
      ら
      ぬ、天井
```
        """
      when "3"
        text = """
```
鳴らない、電
      
        第
        参
話　　　　話       
```
        """
      when "4"
        text = """
```
雨、逃げ出
　　　　し
　　　　た
第四話　後
```
        """
      when "5"
        text = """
```
レ　　第伍話
イ、
心の向こうに    
```
        """
      when "6"
        text = """
```
決戦第３新
　　、　東
　　　　京
第六話　市
```
        """
      when "7"
        text = """
```
人の造りし
第　　　も
七話　　の
```
        """
      when "8"
        text = """
```
瞬　　　　　第
間　　　　　九
、　　　　　話
心、重ねて
```
        """
      when "9"
        text = """
```
瞬　　　　　第
間　　　　　九
、　　　　　話
心、重ねて
```
        """
      when "10"
        text = """
```
マグマ
ダイバー
　　　第拾話     
```
        """
      when "11"
        text = """
```
静
止した闇の
　　　中で
第　　
拾壱話　　　
```
        """
      when "12"
        text = """
```
奇跡の価値は


第拾弐話
```
        """
      when "13"
        text = """
```
使徒、侵
　　　入

第拾参話
```
        """
      when "14"
        text = """
```
　第拾四話
ゼ
｜
レ、魂の座
```
        """
      when "15"
        text = """
```
第
拾
伍
話　嘘と沈
　　　　黙
```
        """
      when "16"
        text = """
```
　　　　　第
死に至る　拾　
　　　　　六
　　　　　話

　病、そして
```
        """
      when "17"
        text = """
```
第拾七話
　　四人目
の適格者 
```
        """
      when "18"
        text = """
```
第拾
　八
　話命の
　　選択を
```
        """
      when "19"
        text = """
```

　第拾九話
　男の戦い

```
        """
      when "20"
        text = """
```
心のかたち
　　　第弐拾話
人のかたち
```
        """
      when "21"
        text = """
```
ネルフ、誕
　　　　生
第弐拾壱話
```
        """
      when "22"
        text = """
```
せめて、人間ら
　　　　　　し
第弐拾弐話　く  
```
        """
      when "23"
        text = """
```
第弐拾参話


　　　　　涙
```
        """
      when "24"
        text = """
```

　　第弐拾伍話
　　終わる世界

```
        """
      when "25"
        text = """
```
　　　最終話
　　世界の中心で
　　アイを叫んだ
　　けもの
```
        """
      when ":iwanami:", "岩浪さん"
        text = """
```
浦和乃話　民
　　　　　度
　　　　　が
　　　　　低
　　　　　い、地域
```
        """
      when "和田さん"
        text = """
```
ソードアートオン
　　　　　　ライン
　　　　　　　　の
　　　　　　　　聖
　　　　　　　　地
所沢乃話
```
        """
      when "中林さん"
        text = """
```
　　　最終話
　　世界の中心で
　　アイを叫んだ
　　大阪人
```
        """
      when "土井さん"
        text = """
```
　　滋賀乃話
母
な
る、みずうみ
```
        """
      else
        text = "知らんがな"

    msg.send text

  robot.respond /ラーメン\s+me$/i, (msg) ->
    msg.send "さぁ食え！\n" +
    "bing image ラーメン"

  robot.respond /バーグ\s+me$/i, (msg) ->
    msg.send "さぁ食え！\n" +
    "bing image ハンバーグ"

  robot.respond /ラーメン\s+bomb\s+(.+)$/i, (msg) ->
    ramenNum = msg.match[1]
    text = "さぁたんと食え！\n"
    for i in [0..ramenNum]
      text += "bing image ラーメン\n"
    msg.send text

  robot.respond /バーグ\s+bomb\s+(.+)$/i, (msg) ->
    burgNum = msg.match[1]
    text = "さぁたんと食え！\n"
    for i in [0..burgNum]
      text += "bing image ハンバーグ\n"
    msg.send text

  robot.respond /date\s+me/i, (msg) ->
    child_process.exec "ruby ../slack_rubys/slack_ruby_01.rb", (error, stdout, stderr) ->
      if !error
        msg.send "success"
      else
        msg.send "error"

  # robot.hear /badger/i, (res) ->
  #   res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"
  #
  # robot.respond /open the (.*) doors/i, (res) ->
  #   doorType = res.match[1]
  #   if doorType is "pod bay"
  #     res.reply "I'm afraid I can't let you do that."
  #   else
  #     res.reply "Opening #{doorType} doors"
  #
  # robot.hear /I like pie/i, (res) ->
  #   res.emote "makes a freshly baked pie"
  #
  # lulz = ['lol', 'rofl', 'lmao']
  #
  # robot.respond /lulz/i, (res) ->
  #   res.send res.random lulz
  #
  # robot.topic (res) ->
  #   res.send "#{res.message.text}? That's a Paddlin'"
  #
  #
  # enterReplies = ['Hi', 'Target Acquired', 'Firing', 'Hello friend.', 'Gotcha', 'I see you']
  # leaveReplies = ['Are you still there?', 'Target lost', 'Searching']
  #
  # robot.enter (res) ->
  #   res.send res.random enterReplies
  # robot.leave (res) ->
  #   res.send res.random leaveReplies
  #
  # answer = process.env.HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING
  #
  # robot.respond /what is the answer to the ultimate question of life/, (res) ->
  #   unless answer?
  #     res.send "Missing HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING in environment: please set and try again"
  #     return
  #   res.send "#{answer}, but what is the question?"
  #
  # robot.respond /you are a little slow/, (res) ->
  #   setTimeout () ->
  #     res.send "Who you calling 'slow'?"
  #   , 60 * 1000
  #
  # annoyIntervalId = null
  #
  # robot.respond /annoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #     return
  #
  #   res.send "Hey, want to hear the most annoying sound in the world?"
  #   annoyIntervalId = setInterval () ->
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #   , 1000
  #
  # robot.respond /unannoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "GUYS, GUYS, GUYS!"
  #     clearInterval(annoyIntervalId)
  #     annoyIntervalId = null
  #   else
  #     res.send "Not annoying you right now, am I?"
  #
  #
  # robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
  #   room   = req.params.room
  #   data   = JSON.parse req.body.payload
  #   secret = data.secret
  #
  #   robot.messageRoom room, "I have a secret: #{secret}"
  #
  #   res.send 'OK'
  #
  # robot.error (err, res) ->
  #   robot.logger.error "DOES NOT COMPUTE"
  #
  #   if res?
  #     res.reply "DOES NOT COMPUTE"
  #
  # robot.respond /have a soda/i, (res) ->
  #   # Get number of sodas had (coerced to a number).
  #   sodasHad = robot.brain.get('totalSodas') * 1 or 0
  #
  #   if sodasHad > 4
  #     res.reply "I'm too fizzy.."
  #
  #   else
  #     res.reply 'Sure!'
  #
  #     robot.brain.set 'totalSodas', sodasHad+1
  #
  # robot.respond /sleep it off/i, (res) ->
  #   robot.brain.set 'totalSodas', 0
  #   res.reply 'zzzzz'
