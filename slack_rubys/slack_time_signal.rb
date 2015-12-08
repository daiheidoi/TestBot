#!/usr/bin/env ruby

require "slack"

Slack.configure do |config|
      config.token = 'xoxp-15751162311-15745376292-16149053830-83d5f684fd'
end

text = case Time.now.hour
       when 10 then '10時: 今日もちんぽこまるだお'
       when 11 then '11時: まだ11時かいな'
       when 12 then '12時: いやまて、腹減った'
       when 13 then '13時: 昼飯やで!!'
       when 14 then '14時: ちんこかゆなってきた'
       when 15 then '15時: 趣味でヒーローをやっているものだ'
       when 16 then '16時: 午後も2時間経過、今日の目標の達成具合を確認しよう'
       when 17 then '17時: 僕17時割と好き'
       when 18 then '18時: あとちょっとやで'
       when 19 then '19時: 帰るか'
       end

Slack.chat_postMessage(text: text, channel: '#smoking-area')
Slack.chat_postMessage(text: text, channel: '#daiheidoi_alim_task')