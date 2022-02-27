document.addEventListener('DOMContentLoaded', () => {
  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  // LIFFアプリを初期化。初期化するとSDKのメソッドを実行できる。
  liff.init({
    liffId: gon.liff_id
  })
    .then(() => {
      if (!liff.isLoggedIn()) {
        // 開発時、外部ブラウザからアクセスするために利用
        liff.login()
      }
    })
    // Start to use liff's api
    .then(() => {
      // ユーザーのIDトークンを取得
      const idToken = liff.getIDToken()
      // railsがパラメータとしてidTokenを受け取れるよう、変数bodyに代入
      const body =`idToken=${idToken}`
      const request = new Request('/users', {
        headers: {
          // 検証するために必須なリクエストヘッダー
          'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
          'X-CSRF-Token': token
        },
        method: 'POST',
        body: body
      });
      // railsにリクエストし、レスポンスを取得
      fetch(request)
        .then(() => {
          // 動画一覧画面にページ遷移
          window.location = '/videos'
        })
    })
})
