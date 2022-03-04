document.addEventListener('DOMContentLoaded', () => {
  const tag = document.createElement('script');
  tag.src = "https://www.youtube.com/iframe_api";
  const firstScriptTag = document.getElementsByTagName('script')[0];
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
  window.onYouTubeIframeAPIReady = function() {
    const player = new YT.Player('player', {
      width: '560',
      height: '315',
      videoId: gon.video.youtube_id,
      playerVars: {
        playsinline: 1,
        rel: 0,
      }
    });
  }
  const send = document.getElementById('send-message');
  const modal = document.getElementById('modal');
  // LIFFプラウザ以外、押すとターゲットピッカーが表示されるボタンを非表示
  if (liff.isInClient()) {
    send.style.display ="display";
    modal.style.display ="display";
  } else {
    send.style.display ="none";
    modal.style.display ="none";
  }
  const video_url = `https://www.sauna-iko.net/videos/${gon.video.id}`;
  send.addEventListener('click', () => {
    // LIFFアプリを初期化。初期化するとSDKのメソッドを実行できる。
    liff.init({
      liffId: gon.liff_id
    })
      .then(() => {
        if (!liff.isLoggedIn()) {
          // 開発時、外部ブラウザからアクセスするために利用
          liff.login()
        }
      });
      liff.shareTargetPicker([
        message = {
          "type": "template",
          "altText": "サウナのお誘い",
          "template": {
            "thumbnailImageUrl": "https://drive.google.com/uc?export=view&id=1PeFmhMPFQAsjT5jS4klisZaUJCj8xc0g",
            "type": "buttons",
            "title": "サウナのお誘い♨",
            "text": "心身ともにととのいたいです！\nだから一緒にサウナ行こ！！",
            "actions": [
              {
                "type": "uri",
                "label": "誘われたサウナを確認する",
                "uri": video_url
              },
              {
                "type": "uri",
                "label": "サウナに行く準備をする",
                "uri": "https://lin.ee/YM3TI37"
              }
            ]
          }
        }
      ])
  })
})
