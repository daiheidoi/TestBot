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
    requestUrl = url + 'character'
    msg
      .http(requestUrl)
      .query($key: key, $character_type: type, $message: message)
      .header('Accept', 'application/json')
      .get() (err, res, body) ->
        if err
          return 'ai取り込み失敗しました'
        result = JSON.parse(body)
        return result

# 自動会話
module.exports = (robot) ->
  robot.hear /ai\s+(\S+)$/i, (msg) ->
    message = encodeURIComponent(msg.match[1])
    user_name = msg.message.user.name
    requestUrl = endPointUrl + 'chat'
    msg
      .http(requestUrl)
      .query($key: key, $bot_name: bot_name, $platform: platform, $user_name: user_name, $message: message)
      .header('Accept', 'application/json')
      .get() (err, res, body) ->
        if err
          msg.send('ai取り込み失敗しました')
          return
        result = JSON.parse(body)
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

