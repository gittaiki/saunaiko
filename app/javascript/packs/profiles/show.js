document.addEventListener('DOMContentLoaded', () => {
  const name = document.getElementById('name');
  const picture = document.getElementById('picture');
  // LIFFアプリを初期化。初期化するとSDKのメソッドを実行できる。
  liff.init({
    liffId: gon.liff_id
  })
    // Start to use liff's api
    .then(() => {
      // ログインユーザーのプロフィール情報を取り出す
      liff.getProfile()
      .then(profile => {
        // アイコン設定していなければ取得しない。
        if (typeof profile.pictureUrl !== 'undefined') {
          picture.src = profile.pictureUrl
        }
        name.innerText = profile.displayName
      })
    })
})
