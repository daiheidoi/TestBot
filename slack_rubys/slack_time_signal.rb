#!/usr/bin/env ruby

require "slack"

Slack.configure do |config|
      config.token = 'xoxp-15751162311-15745376292-22111567315-6dea56412b'
end



text = case Time.now.hour
       when 10 then '10時だよー @shingo_wada: 今日もエクストリームしてますか？'
       when 11 then '11時だよー @shingo_wada: 転職先は決まりましたか？'
       when 12 then '12時だよー @shingo_wada: 労働局との交渉はどうでしたか？'
       when 13 then '13時だよー @shingo_wada: 弁護士さんとの相談はどうでしたか？'
       when 14 then '14時だよー @shingo_wada: 営業さんには話しましたか？'
       when 15 then '15時だよー @shingo_wada: 契約書のコピーもらいましたか？'
       when 16 then '16時だよー @shingo_wada: 次の案件は決まりましたか？'
       when 17 then '17時だよー @shingo_wada: 家裁に行きましたか？'
       when 18 then '18時だよー @shingo_wada: 中林さんのお話はどうするんですか？'
       when 19 then '19時だよー @shingo_wada: 文鳥ですっwうちのかわいいペット'
       end

Slack.chat_postMessage(text: text, channel: '#smoking-area', username: '時報くん', icon_emoji: ':kaoringo:', link_names: '@shingo_wada' )
