#coding: utf-8

import urllib
import urllib2
import sys

url = "https://slack.com/api/chat.postMessage"

params = {'token':'xoxp-15751162311-15745376292-35448987459-53e17d59e7',   # トークン
          'channel':'C0FT2FNUE', # チャンネルID
          'text': ''    # 送信するテキスト
}

params['text'] = '僕が' + sys.argv[2] +  'ファイルは' + sys.argv[1] + 'だ！！'
params = urllib.urlencode(params)

req = urllib2.Request(url)
# ヘッダ追加
req.add_header('Content-Type', 'application/x-www-form-urlencoded')
# パラメータ追加
req.add_data(params)

res = urllib2.urlopen(req)

# レスポンス取得
body = res.read()
