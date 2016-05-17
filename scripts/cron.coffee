cronJob = require('cron').CronJob
 
module.exports = (robot) -> 
  # *(sec) *(min) *(hour) *(day) *(month) *(day of the week)
  new cronJob('0 0-59 * * * *', () ->
    currentTime = new Date
    currentTime.setTime(currentTime.getTime() + 9 * 60 * 60 * 1000)
    envelope = room: "#smoking-area"
    robot.send envelope, "current time is #{currentTime.getHours()}:#{currentTime.getMinutes()}."
  ).start()
