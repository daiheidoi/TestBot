<?php
 
function postSlack($txt) {
	$token = "xoxp-15751162311-15745376292-16149053830-83d5f684fd";
	$icon_emoji = ":doi_hanco:";
	$channel = "C0FN0GZ51";
	$username = "php_bot"; 
	$txt = urlencode($txt);
	$url = "https://slack.com/api/chat.postMessage?token=${token}&channel=${channel}&text=${txt}&icon_emoji=${icon_emoji}&username=${username}";
	file_get_contents($url);
}
 
// 「Hello Slack」とメッセージを送信
postSlack("Hello Slack!");
?>
