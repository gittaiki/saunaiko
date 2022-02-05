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
  const redirect_url = `https://liff.line.me/${gon.liff_id}/videos/${gon.video.id}`;
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
          "altText": "サウナのお誘いが届いています",
          "template": {
            "thumbnailImageUrl": "https://res.cloudinary.com/dr1peiwz2/image/upload/v1613642190/girl_ymjnoj.jpg",
            "type": "buttons",
            "title": "サウナのお誘い",
            "text": "サウナのお誘いが届いています",
            "actions": [
              {
                "type": "uri",
                "label": "誘われたサウナを確認する",
                "uri": redirect_url
              }
            ]
          }
        }
      ])
      .then(() => {
        document.getElementById('success').innerText = 'サウナのお誘いをしました'
      })
      .catch(() => {
        document.getElementById('error').innerText = 'サウナのお誘いに失敗しました'
      });
  })
})
