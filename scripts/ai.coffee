# Description:
#   ユーザーローカルAI組み込み
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_USER_LOCAL_AI_KEY
#   HUBOT_SLACK_BOTNAME
#
# Commands:
#   ai <query> - 自動会話
#	cat <query> - 猫言葉
#	dog <query> - 犬言葉
#	jijii <query> - じじい言葉
#	name <query> - 氏名解析
#	decompose <query> - 形態解析
#
# Author:
#  daiheidoi

endPointUrl = 'https://chatbot-api.userlocal.jp/api/'
key = process.env.HUBOT_USER_LOCAL_AI_KEY
bot_name = process.env.HUBOT_SLACK_BOTNAME
platform= "slack"

getCharacterBotRes = (msg, type, url = endPointUrl) ->
    message = encodeURIComponent(msg.match[1])
    requestUrl = url + "character?key=#{key}&character_type=#{type}&message=#{message}"
    msg
      .http(requestUrl)
      .header('Accept', 'application/json')
      .get() (err, res, body) ->
        if err
          return 'ai取り込み失敗しました'
        result = JSON.parse(body).result
        return result

# 自動会話
module.exports = (robot) ->
  robot.hear /ai\s+(\S+)$/i, (msg) ->
    message = encodeURIComponent(msg.match[1])
    user_name = msg.message.user.name
    requestUrl = endPointUrl + "chat?key=#{key}&bot_name=#{bot_name}&platform=#{platform}&user_name=#{user_name}&message=#{message}"
    msg
      .http(requestUrl)
      .header('Accept', 'application/json')
      .get() (err, res, body) ->
        if err
          msg.send('ai取り込み失敗しました')
          return
        result = JSON.parse(body).result
        msg.send result

# 猫言葉
module.exports = (robot) ->
  robot.hear /cat\s+(\S+)$/i, (msg) ->    
    msg.send getCharacterBotRes msg, "cat"

# 犬言葉
module.exports = (robot) ->
  robot.hear /dog\s+(\S+)$/i, (msg) ->
    msg.send getCharacterBotRes msg, "dog"

# じじい言葉
module.exports = (robot) ->
  robot.hear /jijii\s+(\S+)$/i, (msg) ->
    msg.send getCharacterBotRes msg, "jijii"

# 氏名解析
module.exports = (robot) ->
  robot.hear /name\s+(\S+)$/i, (msg) ->
    name = encodeURIComponent(msg.match[1])
    requestUrl = endPointUrl + "name?key=#{key}&name=#{name}"
    msg
      .http(requestUrl)
      .header('Accept', 'application/json')
      .get() (err, res, body) ->
        if err
          msg.send('ai取り込み失敗しました')
          return
        result = JSON.parse(body).result
        suspendNickname = ""
        imaginGender = ""
        gender = ""
        if result.gender == "1"
          gender = "男"
        else
          gender = "女"
        if result.gender_accuracy == "1"
          imaginGender = "#{gender}かな。。。いや自信ないわw"
        if result.gender_accuracy == "2"
          imaginGender = "多分、#{gender}やろ"
        if result.gender_accuracy == "3"
          imaginGender = "#{gender}やろ"
        if result.gender_accuracy == "4"
          imaginGender = "#{gender}やな。そうじゃなかったら泣くわ"
        if result.gender_accuracy == "5"
          imaginGender = "#{gender}すぎてワロリンヌ"
        
        for nickname in result.nickname
          suspendNickname += nickname + "\n"
        msg.send imaginGender + "\n" + suspendNickname


# 形態解析
module.exports = (robot) ->
  robot.hear /decompose\s+(\S+)$/i, (msg) ->
    requestUrl = endPointUrl + "decompose"
    msg
      .http(requestUrl)
      .query(key: key, message: msg.match[1], detail: "true")
      .header('Accept', 'application/json')
      .get() (err, res, body) ->
        if err
          msg.send('ai取り込み失敗しました')
          return
        result = JSON.parse(body).result
        sendMsg = ""
        for data in result
          sendMsg += "`#{data.surface}`は\n"
          sendMsg += "#{data.pos}で、#{data.yomi}って読むやろ\n"
          if data.pos1?
            sendMsg += "さらにいうと、#{data.pos1}で\n"
          if data.pos2?
            sendMsg += "またさらにいうと、#{data.pos2}であって\n"
          if data.pos3?
            sendMsg += "もう勘弁してくれって思うくらい、#{data.pos3}\n"
          if data.ctype?
            sendMsg += "#{data.ctype}とか\n"
          if data.cform?
            sendMsg += "#{data.cform}って活用できるやろ\n"


        sendMsg += "どう？当たってるやろ"
        msg.send sendMsg