require 'json'

class LineBotsController < ApplicationController
  # CSRF対策を無効化する設定
  protect_from_forgery except: [:callback]

  def callback
    # LINEから送信されたメッセージ内容を文字列に変換し変数にする
    body = request.body.read
    # ヘッダーに格納された署名の情報を変数にする
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    # validate_signatureメソッドは署名の検証している
    # 引数のbodyは文字列で渡す必要がある
    return head :bad_request unless client.validate_signature(body, signature)

    # 変数bodyのevent以下の文字列を配列化して取得
    events = client.parse_events_from(body)
    events.each do |event|
      # eventがLine::Bot::Event::Messageクラスかどうかを評価
      case event
      when Line::Bot::Event::Message
        # textであるかどうかを評価
        case event.type
        when Line::Bot::Event::MessageType::Text

          message = event.message['text']
          # JSONファイルに文字列[message]のjsonデータがあるか検証
          if api_response[message]
            client.reply_message(event['replyToken'], api_response[message])
          else
            client.reply_message(event['replyToken'], api_response['予想しないメッセージ'])
          end
        end
      end
    end
    head :ok
  end

  private

  # LINE Messaging API SDKの機能を使うには自身の「チャンネルシークレット」と「チャンネルアクセストークン」を設定する必要がある。
  # callbackメソッドで複数回呼び出されるため、1回目のみ右辺を代入するようにしている
  def client
    @client ||= Line::Bot::Client.new do |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    end
  end

  # public/jsonにあるJSONファイルを呼びだす
  def api_response
    # モジュールparseは文字列しかRubyオブジェクトに変換できない
    @json ||= open('public/json/line-bot.json').read
    JSON.parse(@json)
  end
end
