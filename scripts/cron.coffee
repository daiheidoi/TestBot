cronJob = require('cron').CronJob
 
module.exports = (robot) -> 
  # *(sec) *(min) *(hour) *(day) *(month) *(day of the week)
  new cronJob('0 0-59 * * * *', () ->
    currentTime = new Date
    envelope = room: "#smoking-area"
    robot.send envelope, "current time is #{currentTime.getHours()}:#{currentTime.getMinutes()}."
  ).start()
