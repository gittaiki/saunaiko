class LiffInterface
  attr_reader :id_token

  def initialize(id_token)
    @id_token = id_token
  end

  def response
    channel_id = ENV['LIFF_CHANNEL_ID']
    params = { 'id_token' => @id_token, 'client_id' => channel_id }
    uri = URI.parse('https://api.line.me/oauth2/v2.1/verify')
    # IDトークンを検証し、ユーザーの情報を取得
    res = Net::HTTP.post_form(uri, params)
    # LINEユーザーIDを取得
    JSON.parse(res.body)['sub']
  end
end
