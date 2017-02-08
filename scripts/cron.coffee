cronJob = require('cron').CronJob
random = (n) -> Math.floor(Math.random() * n)

wadalib = [
    'からの',
    '要するに',
    'やがて',
    'もはや',
    '須く',
    'だがしかし',
    'というか',
    'もう',
    '察するに'
 ]

module.exports = (robot) -> 
  # *(sec) *(min) *(hour) *(day) *(month) *(day of the week)
  new cronJob('0 0 * * * *', () ->
    currentTime = new Date
    currentTime.setTime(currentTime.getTime() + 9 * 60 * 60 * 1000)
    envelope = room: "#jihou_kun"
    robot.send envelope, "@channel 【時報】#{wadalib[random(wadalib.length - 1)]}、#{currentTime.getHours()}時やで"
  ).start()
