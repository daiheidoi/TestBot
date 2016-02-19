#!/usr/bin/env ruby

require "slack"

Slack.configure do |config|
      config.token = 'xoxp-15751162311-15745376292-16149053830-83d5f684fd'
end

text = case Time.now.hour
       when 10 then '10時だよー'
       when 11 then '11時だよー'
       when 12 then '12時だよー'
       when 13 then '13時だよー'
       when 14 then '14時だよー'
       when 15 then '15時だよー'
       when 16 then '16時だよー'
       when 17 then '17時だよー'
       when 18 then '18時だよー'
       when 19 then '19時だよー'
       end

Slack.chat_postMessage(text: text, channel: '#smoking-area', username: 'ruby_bot' )
