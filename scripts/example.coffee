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

module.exports = (robot) ->
  robot.respond /(うんこ|うんち)$/i, (msg) ->
    msg.send "ぶりーーーーーーっ :poop: :poop: :poop: :poop: "

  robot.respond /かおりんご$/i, (msg) ->
    text = "顔、りんごやん :kaoringo:"
    msg.send text 

  robot.respond /かおりんご\s+bomb\s+(\S+)$/i, (msg) ->
    cnt = msg.match[1]
    text = "めっちゃ顔、りんごやん"
    for i in [0..cnt]
      if i % 5 == 0 then text += "\n"
      text += ":kaoringo: "
    msg.send text

  robot.respond /ごりりんご$/i, (msg) ->
    cnt = msg.match[1]
    text = "これが夢のコラボや！"
    for i in [0..499]
      iwanami = ":iwanami: "
      kaoringo = ":kaoringo: "
      if i % 500 == 0 then text += "\n"
      if i % 500 == 0 then iwanami = kaoringo
      if i % 500 == 0 then kaoringo = iwanami
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
