cronJob = require('cron').CronJob
random = (n) -> Math.floor(Math.random() * n)

wadalib = [
    '今日もエクストリームしてますか？',
    '転職先は決まりましたか？',
    '労働局との交渉はどうでしたか？',
    '弁護士さんとの相談はどうでしたか？',
    '営業さんには話しましたか？',
    '契約書のコピーもらいましたか？',
    '次の案件は決まりましたか？',
    '家裁に行きましたか？',
    'やめた方がいいですよ'
 ]

module.exports = (robot) -> 
  # *(sec) *(min) *(hour) *(day) *(month) *(day of the week)
  new cronJob('0 0 10-22 * * *', () ->
    currentTime = new Date
    currentTime.setTime(currentTime.getTime() + 9 * 60 * 60 * 1000)
    envelope = room: "#smoking-area"
    robot.send envelope, "【時報】 #{currentTime.getHours()}時だよー @shingo_wada: #{wadalib[random(wadalib.length - 1)]}"
  ).start()
