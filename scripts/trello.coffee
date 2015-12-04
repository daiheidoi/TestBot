# Description:
#   Returns the URL of the first bing hit for a query
#
# Dependencies:
#   None
#
# Configuration:
#   $ heroku config:set HUBOT_TRELLO_KEY=e977a363bce024ca2aa730dbe0b9bad8
#   $ heroku config:set HUBOT_TRELLO_TOKEN=8bc41daa4f2b67ff543d1a11ed0984b31e206c801f68e04689300abe26ce2e7f
#   $ heroku config:set HUBOT_TRELLO_LIST=5660fe5fc0b066a1cc7c96e8
#
# Commands:
#   hubot todo <query> - trelloのTODOリストに簡単登録
#
# Author:
#   Brandon Satrom

module.exports = (robot) ->
  robot.respond /^todo (.*)/i, (msg) ->
    title = "#{msg.match[1]}"

    Trello = require("node-trello")
    t = new Trello(process.env.HUBOT_TRELLO_KEY, process.env.HUBOT_TRELLO_TOKEN)
    t.post "/1/cards", {name: title, idList: process.env.HUBOT_TRELLO_LIST}, (err, data) ->
      if err
        msg.send "保存できませんでした"
        return
      msg.send "「#{title}」 をTrelloに保存しました"
