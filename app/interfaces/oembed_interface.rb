class OembedInterface
  attr_reader :video

  def initialize(video)
    @video = video
  end

  def response
    oembed_url = URI.parse("https://www.youtube.com/oembed?url=https://www.youtube.com/watch?v=#{@video.youtube_id}&format=json")
    res = Net::HTTP.get_response(oembed_url)
    JSON.parse(res.body)
  end
end
