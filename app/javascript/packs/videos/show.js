document.addEventListener('DOMContentLoaded', () => {
  const tag = document.createElement('script');
  tag.src = "https://www.youtube.com/iframe_api";
  const firstScriptTag = document.getElementsByTagName('script')[0];
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
  let player;
  window.onYouTubeIframeAPIReady = function() {
    player = new YT.Player('player', {
      width: '560',
      height: '315',
      videoId: gon.youtube_id,
      events: {
        // api呼び出す準備ができると起動
        'onReady': function(evt) {
          evt.target.mute();
          evt.target.playVideo();
        },
        // プレーヤーの状態が変わると起動
        'onStateChange': function(evt) {
          switch (evt.data) {
            // 動画をループ再生
            case YT.PlayerState.ENDED:
              evt.target.playVideo();
              break;
          }
        }
      },
      playerVars: {
        playsinline: 1,
      }
    });
  }
})
