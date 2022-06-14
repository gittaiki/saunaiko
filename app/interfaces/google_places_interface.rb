class GooglePlacesInterface
  attr_reader :event

  def initialize(event)
    @event = event
  end

  def search
    data = GooglePlaces::Client.new(ENV['GOOGLE_API_KEY'])
    latitude = @event.message['latitude']
    longitude = @event.message['longitude']
    place = data.spots(latitude, longitude, name: 'サウナ', language: 'ja', radius: 2).first
    if place
      client.reply_message(@event['replyToken'],
                           {
                             "type": 'location',
                             "title": place.name,
                             "address": place.vicinity,
                             "latitude": place.lat,
                             "longitude": place.lng
                           })
    else
      client.reply_message(@event['replyToken'],
                           { "type": 'text',
                             "text": '送信した位置付近にサウナは見つかりませんでした😓 別の位置で検索してみてください。' })
    end
  end

  private

  def client
    @client ||= Line::Bot::Client.new do |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    end
  end
end
