<h2 align="center">:hotsprings::droplet:サウナイコ:droplet::hotsprings:</h2>
<p align="center">一緒にサウナに行きたい友だちに、<br>楽しみ方と魅力を学んでもらうサービスです。</p>

![title-image](https://user-images.githubusercontent.com/83480020/159718387-5a910a4c-2d7c-4cf1-bbe3-8fd1cd09c9e9.png)

## :link:App URL
### https://www.sauna-iko.net/
(※スマートフォン推奨)
<br>
<br>

## :hotsprings:サウナイコについて
### ターゲットユーザー
- サウナー
- サウナの魅力に気づいていない友だち

### 使用画面一部
|                                                               トップ                                                                |                                                          カロリー計算結果                                                           |                                                            食品検索結果                                                             |
| :---------------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------------: |
| [![Image from Gyazo](https://i.gyazo.com/4deb5fab9b010287c4d07bb787a87ef8.gif)](https://gyazo.com/4deb5fab9b010287c4d07bb787a87ef8) | [![Image from Gyazo](https://i.gyazo.com/94b69e3630c431a9091790ef8cdfd120.gif)](https://gyazo.com/94b69e3630c431a9091790ef8cdfd120) | [![Image from Gyazo](https://i.gyazo.com/0edffb3396c54a24dfe850a37d66033b.gif)](https://gyazo.com/0edffb3396c54a24dfe850a37d66033b) |

### 実装機能 (使用Gem)
**Webアプリ**
- サウナ動画検索機能 (ransack)
- LINEアカウント友だち追加機能

**LINEトーク画面**
- サウナ作法のチャット形式学習機能 (line-bot-api)
  - サウナの入り方とマナー
  - ととのうコツ
- 位置情報近辺のサウナ検索機能 (google_places)

**LIFFアプリ**
- サウナ動画検索機能 (ransack)
  - お気に入り機能
  - 視聴済み機能
  - サウナのお誘い機能
- サ活記録機能
  - 各月のサ活レポート閲覧機能 (chartkick)
  - 削除機能
<br>

## :bulb:サービスをつくった背景
### ユーザーが抱える課題
- 友だちにサウナの魅力を言葉で説明するのが難しい。
- 友だちと好きなサウナを共有したい。

### 解決方法
動画とチャットでサウナの楽しみ方と魅力を学ぶことができるアプリケーション

### なぜつくったのか？
肩こりや腰痛で悩んでいたとき、サウナに入ると解消できたのがきっかけで通うようになりました。<br>
サウナは上記のほか、デジタルデトックスと睡眠の質向上等も見込めるので、全人類サウナに通うべきだと思います。<br>
しかし、誘われたら行くが1人では行かない人が多く、魅力に気づいていない人が一定数いるためつくりました。
<br>
<br>

## :wrench:使用技術
- Ruby 2.7.2
- Rails 6.0.4
- RSpec
- JavaScript
- LIFF(LINE Front-end Framework)
- LINE Messaging API
- Google Places API

## ER図
https://drive.google.com/file/d/12iv4-OW0wd0lDeEbc-ul2gdFiDM2Y6FX/view?usp=sharing
