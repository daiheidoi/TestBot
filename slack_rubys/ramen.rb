require 'slack'

Slack.configure do |config|
	config.token = 'xoxp-15751162311-15745376292-35448987459-53e17d59e7'
end

ramenNum = ARGV[0].to_i
text = ""

if ramenNum == 0
	text += "さぁ食え！\n"
    text += "bing image ラーメン"

	Slack.chat_postMessage(text: text, channel: '#smoking-area', username: 'daihei.doi')
else
	text += "さぁたんと食え！\n"

	for i in 1..ramenNum do
    	text += "bing image ラーメン"	
    end

    Slack.chat_postMessage(text: text, channel: '#smoking-area', username: 'daihei.doi					')
end		
	

