#!/usr/bin/env ruby
require 'slack'

Slack.configure {|config| config.token = 'xoxb-16357547427-5cgzFGpXdTuYOtNXLwZFgpDJ'}

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

