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
})
