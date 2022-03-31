require 'json'

class LineBotsController < ApplicationController
  skip_before_action :login_required
  # CSRF対策を無効化
  protect_from_forgery except: [:callback]

  def callback
    body = request.body.read
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    return head :bad_request unless client.validate_signature(body, signature)

    events = client.parse_events_from(body)
    events.each do |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          message = event.message['text']
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

  def client
    @client ||= Line::Bot::Client.new do |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    end
  end

  def api_response
    @json ||= open('public/json/line-bot.json').read
    JSON.parse(@json)
  end
end
