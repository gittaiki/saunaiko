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
      },
      // events: {
      //   // api呼び出す準備ができると起動
      //   'onReady': function(evt) {
      //     evt.target.mute();
      //     evt.target.playVideo();
      //   }
      // }
    });
  }
  const video_url = `https://43f8-180-57-16-113.ngrok.io/videos/${gon.video.id}`;
  const account_url = `https://lin.ee/YM3TI37`;
  const send = document.getElementById('send');
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
            "thumbnailImageUrl": "https://drive.google.com/uc?export=view&id=1BvbtKEE_7GvHUlusKQnFshFuUPZ2U-Cy",
            "type": "buttons",
            "title": "サウナのお誘い♨",
            "text": "サウナに行きたいです！\n一緒にととのいましょう！",
            "actions": [
              {
                "type": "uri",
                "label": "誘われたサウナを確認する",
                "uri": video_url
              },
              {
                "type": "uri",
                "label": "サウナに行く準備をする",
                "uri": account_url
              }
            ]
          }
        }
      ])
  })
})
