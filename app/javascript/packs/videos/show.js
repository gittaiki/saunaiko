document.addEventListener('DOMContentLoaded', () => {
  const tag = document.createElement('script');
  tag.src = "https://www.youtube.com/iframe_api";
  const firstScriptTag = document.getElementsByTagName('script')[0];
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
  window.onYouTubeIframeAPIReady = function() {
    const player = new YT.Player('player', {
      width: '560',
      height: '315',
      videoId: gon.youtube_id,
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
})
