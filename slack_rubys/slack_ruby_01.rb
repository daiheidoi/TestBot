# !/usr/bin/env ruby
require 'slack'

Slack.configure do |config|
	config.token = 'xoxp-15751162311-15745376292-16149053830-83d5f684fd'
end

Slack.chat_postMessage(text: "TESTちんぽこ丸", channel: '#smoking-area')

#require 'slack'
#Slack.configure {|config| config.token = TOKEN }
#client = Slack.realtime

#client.on :hello do
#  puts 'Successfully connected.'
#end

#client.on :message do |data|
  # respond to messages
#end

#client.start
