# Description:
#   Returns 美人
#
#
# Commands:
#   hubot bijin - 美人を返します
#
# Author:
#   

module.exports = (robot) ->
  robot.respond /美人/i, (msg) ->
    msg
      .http('http://bjin.me/api/?type=rand&count=1&format=json')
      .header('Accept', 'application/json')
      .get() (err, res, body) ->
        if err
          msg.send('美人の取得に失敗しました')
          return
        result = JSON.parse(body)
        msg.send "お名前: #{result.id}\n" +
        "#{result.pubDate}\n" +
        "link: #{result.link}\n" +
        "result: #{result}\n" +
        "res: #{res}\n" +
        "body: #{body}"