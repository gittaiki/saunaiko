document.addEventListener('DOMContentLoaded', () => {
  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  // LIFFのメソッドを実行できるようにする
  liff.init({
    liffId: gon.liff_id
  })
  .then(() => {
    if (!liff.isLoggedIn()) {
      // 外部ブラウザからでもログイン処理を行う
      liff.login()
    }
  })
  .then(() => {
    // ユーザーのIDトークンを取得
    const idToken = liff.getIDToken()
    const body =`idToken=${idToken}`
    const request = new Request('/users', {
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
        'X-CSRF-Token': token
      },
      method: 'POST',
      body: body
    });
    fetch(request)
    .then(() => {
      window.location = '/videos'
    })
  })
})
