class LineBotInterface
  attr_reader :request

  def initialize(request)
    @request = request
  end

  def reply
    body = @request.body.read
    signature = @request.env['HTTP_X_LINE_SIGNATURE']
    return head :bad_request unless client.validate_signature(body, signature)

    events = client.parse_events_from(body)
    events.each do |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          message = event.message['text']
          if json_message[message]
            client.reply_message(event['replyToken'], json_message[message])
          else
            client.reply_message(event['replyToken'], json_message['予想しないメッセージ'])
          end
        when Line::Bot::Event::MessageType::Location
          places = GooglePlaces::Client.new(ENV['GOOGLE_API_KEY'])
          latitude = event.message['latitude']
          longitude = event.message['longitude']
          place = places.spots(latitude, longitude, name: 'サウナ', language: 'ja').first
          if place
            client.reply_message(event['replyToken'],
                                 {
                                   "type": 'location',
                                   "title": place.name,
                                   "address": place.vicinity,
                                   "latitude": place.lat,
                                   "longitude": place.lng
                                 })
          else
            client.reply_message(event['replyToken'],
                                 { "type": 'text',
                                   "text": '送信した位置付近にサウナは見つかりませんでした💦\n別の位置で検索してみてください。' })
          end
        end
      end
    end
  end

  private

  def client
    @client ||= Line::Bot::Client.new do |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    end
  end

  def json_message
    open('public/json/line-bot.json') do |json|
      JSON.parse(json.read)
    end
  end
end
