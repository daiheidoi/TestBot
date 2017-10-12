# Description:
#   Queries Bing and returns a random image from the top 50 images found using Bing API
#
# Dependencies:
#   None
#
# Configuration:
#   GOOGLE_CUSTOM_SEARCH_ENGINE_ID
#   GOOGLE_API_KEY
#
# Commands:
#   img <query> - Queries Bing Images for <query> & returns a random result from top 50
#
# Author:
#   daihei doi
GCSEAccountKey = process.env.GOOGLE_CUSTOM_SEARCH_ENGINE_ID
GAPIKey = process.env.GOOGLE_API_KEY
unless GCSEAccountKey
  throw "You must set GOOGLE_CUSTOM_SEARCH_ENGINE_ID in your environment vairables"
unless GAPIKey
  throw "You must set GOOGLE_API_KEY in your environment vairables"

module.exports = (robot) ->
  robot.hear /^gimg( image)? (.*)/i, (msg) ->
    imageMe msg, msg.match[2], (url) ->
      time = Date.now()
      msg.send url + "?#{time}"

imageMe = (msg, query, cb) ->
  msg.http('https://www.googleapis.com/customsearch/v1')
    .query(q: "'" + query + "'", $key: GAPIKey, $cx: GCSEAccountKey, $searchType: "image", $num: 10)
    .get() (err, res, body) ->
      try
        images = JSON.parse(body).items
        image = msg.random images
        cb image.link
      catch error
        cb body
