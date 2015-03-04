class Streams
  include Cinch::Plugin

  @@streams = [
    "mdids"
  ]

  match "streams"

  def execute(m)
    @@streams.each do |stream|
      if s = get_stream_info(stream)
        m.reply "#{s[:display_name]} - #{s[:status]} - #{s[:viewers]} viewers watching @ #{Cinch::Toolbox.shorten(s[:url])}"
      end
    end
  end

  private

  def get_stream_info(stream_name)
    url = "https://api.twitch.tv/kraken/streams/#{stream_name}"
    response = HTTParty.get(url)
    return false unless response["stream"]

    { 
      display_name: response["stream"]["channel"]["display_name"],
      status: response["stream"]["channel"]["status"],
      viewers: response["stream"]["viewers"],
      url: response["stream"]["channel"]["url"]
    }
  end

end
