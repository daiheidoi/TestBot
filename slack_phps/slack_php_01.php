<?php
$incomingUrl = 'https://slack.com/api/chat.postMessage'; // 発行されたURL
$payload = array(
	'token' => 'xoxp-15751162311-15745376292-35448987459-53e17d59e7',
	'text' => '投稿テスト', // メッセージ（必須）
	'username' => 'php_bot', // 投稿者（サービス）名
	'icon_emoji' => ':doi_hanco:', // 投稿者名のアイコン http://www.emoji-cheat-sheet.com/
	'channel' => '#smoking_area', // Channel（#または@から始まるchannel名）
);

$result = slackApiExecute($incomingUrl, $payload);
var_dump($result);

function slackApiExecute($url, $payload)
{
    $headers = array();
    $params = array('payload' => json_encode($payload));
    $result = postRequest($url, $params, $headers);
    return $result;
}
function postRequest($url, $params, $headers = array())
{
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
    $result = curl_exec($ch);
    $error = curl_error($ch);
    curl_close($ch);
    if ($error) {
        throw new \Exception($error);
    }
    return $result;
}
?>
