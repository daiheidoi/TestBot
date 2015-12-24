#!/usr/bin/env ruby
require 'slack'

Slack.configure {|config| config.token = 'xoxp-15751162311-15745376292-16149053830-83d5f684fd'}

client = Slack.realtime

client.on :hello do
  puts 'Successfully connected.'
end

client.on :message do |data|
  case data['text']
  when 'bot hi' then
    client.message channel: data['channel'], text: "Hi <@#{data['user']}>!"
  when /^bot/ then
    client.message channel: data['channel'], text: "Sorry <@#{data['user']}>, what?"
  end
end

