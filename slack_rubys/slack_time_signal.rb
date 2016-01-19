#!/usr/bin/env ruby

require "slack"

Slack.configure do |config|
      config.token = 'xoxp-15751162311-15745376292-16149053830-83d5f684fd'
end

text = case Time.now.hour
       when 10 then 'bing image 10時'
       when 11 then 'bing image 11時'
       when 12 then 'bing image 12時'
       when 13 then 'bing image 13時'
       when 14 then 'bing image 14時'
       when 15 then 'bing image 15時'
       when 16 then 'bing image 16時'
       when 17 then 'bing image 17時'
       when 18 then 'bing image 18時'
       when 19 then 'bing image 19時'
       end

Slack.chat_postMessage(text: text, channel: '#smoking-area', username: 'ruby_bot' )
