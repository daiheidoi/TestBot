#!/usr/bin/env ruby
require "slack"

Slack.configure do |config|
	config.token = 'xoxp-15751162311-15745376292-16149053830-83d5f684fd'
end

Slack.chat_postMessage(text: "TEST!", channel: 'daiheidoi_alim_task')

