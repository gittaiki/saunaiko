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
    const send = document.getElementById('send');
    send.addEventListener('click', () => {
      liff.shareTargetPicker([
        message = {
          "type": "template",
          "altText": "サウナのオファー",
          "template": {
            "thumbnailImageUrl": "https://drive.google.com/uc?export=view&id=1YbsO4D1LwKCp3gHib-ke8ruZ1E1RJFzV",
            "type": "buttons",
            "title": "サウナのオファー♨",
            "text": "一緒にサウナでととのいたいです！\nオファーを受けてください！",
            "actions": [
              {
                "type": "uri",
                "label": "オファーを受け取る",
                "uri": "https://lin.ee/YM3TI37"
              }
            ]
          }
        }
      ])
    })
})
