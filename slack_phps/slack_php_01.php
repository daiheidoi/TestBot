<? php
// 定数の定義
define("Token", "xoxp-15751162311-15745376292-16149053830-83d5f684fd");// full-access token
define("Channel", "%23daiheidoi_alim_task");// 通知送り先のチャンネル名
 
function postSlack($txt) {
    $txt = urlencode($txt);
    $url = "https://slack.com/api/chat.postMessage?token=".Token."&channel=".Channel."&text=${txt}&as_user=true";
    file_get_contents($url);
}
 
// 「Hello Slack」とメッセージを送信
postSlack("Testちんこ");
exit;
?>