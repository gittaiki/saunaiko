document.addEventListener('DOMContentLoaded', () => {
  const name = document.getElementById('name');
  const picture = document.getElementById('picture');
  // LIFFのメソッドを実行できるようにする
  liff.init({
    liffId: gon.liff_id
  })
  .then(() => {
    // ログインユーザーのプロフィール情報を取り出す
    liff.getProfile()
    .then(profile => {
      // アイコン設定していなければ取得しない
      if (typeof profile.pictureUrl !== 'undefined') {
        picture.src = profile.pictureUrl
      }
      name.innerText = profile.displayName
    })
  })
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
  send.addEventListener('click', () => {
    // ターゲットピッカーを表示
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
              "label": "サウナに行く準備をする",
              "uri": "https://lin.ee/YM3TI37"
            }
          ]
        }
      }
    ])
  })
})
