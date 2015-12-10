#!/usr/bin/env ruby

require "slack"

Slack.configure do |config|
      config.token = 'xoxp-15751162311-15745376292-16149053830-83d5f684fd'
end

text = case Time.now.hour
       when 10 then '10時: 私の戦闘力は53万です'
       when 11 then '11時: みんなって誰だよ・・・・・・。かーちゃんに『みんな持ってるよぉ！』って物ねだるときに言うみんなかよ・・・・・・。誰だよそいつら・・・・・・。友達いないからそんな言い訳使えたことねぇよ・・・・・・ '
       when 12 then '12時: そりゃ悪手だろ蟻んコ'
       when 13 then '13時: おめーも死ぬまで死ぬなよ'
       when 14 then '14時: みんながぼっちになれば争いも揉め事も起きないだろ'
       when 15 then '15時: 趣味でヒーローをやっているものだ'
       when 16 then '16時: 死ねとか殺すとか軽々しく言うんじゃねぇよ。ぶっ殺すぞ。'
       when 17 then '17時: いやまて・・・俺は悪くない、社会が悪い。'
       when 18 then '18時: 女子の言う『いい人』とは１００％どうでもいい人の事である。'
       when 19 then '19時: 帰るか'
       end

Slack.chat_postMessage(text: text, channel: '#smoking-area', username: '時報bot君' icon_emoji: ':doi_hanco:' )
