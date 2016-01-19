#!/usr/bin/env ruby

require "slack"

Slack.configure do |config|
      config.token = 'xoxp-15751162311-15745376292-16149053830-83d5f684fd'
end

text = case Time.now.hour
       when 10 then 'bing image 美人'
       when 11 then 'bing image 美人'
       when 12 then 'bing image 美人'
       when 13 then 'bing image 美人'
       when 14 then 'bing image 美人'
       when 15 then 'bing image 美人'
       when 16 then 'bing image 美人'
       when 17 then 'bing image 美人'
       when 18 then 'bing image 美人'
       when 19 then 'bing image 美人'
       end

Slack.chat_postMessage(text: text, channel: '#smoking-area', username: 'ruby_bot' )
