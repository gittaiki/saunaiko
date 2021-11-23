class LineBotsController < ApplicationController
  # CSRF対策を無効化する設定
  protect_from_forgery except: [:callback]

  def callback
    # 3-10.LINEから送信されたメッセージ内容を文字列に変換し変数にする
    body = request.body.read
    # ヘッダーに格納された署名の情報を変数にする
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    # validate_signatureメソッドは署名の検証している
    # 引数のbodyは文字列で渡す必要がある
    return head :bad_request unless client.validate_signature(body, signature)

    # 変数bodyを配列化
    events = client.parse_events_from(body)
    events.each do |event|
      # eventがLine::Bot::Event::Messageクラスかどうかを評価
      case event
      when Line::Bot::Event::Message
        # textであるかどうかを評価
        case event.type
        when Line::Bot::Event::MessageType::Text
          message = {
            type: 'text',
            # 送られてきたメッセージを取り出す
            text: event.message['text']
          }
          client.reply_message(event['replyToken'], message)
        end
      end
    end
    head :ok
  end

  private

  # LINE Messaging API SDKの機能を使うことができるように設定
  def client
    @client ||= Line::Bot::Client.new do |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    end
  end
end
