class OfficialStream
  include Cinch::Plugin

  match /(officialstream)/

  def execute(m)
    url = "https://api.twitch.tv/kraken/streams/unrealengine"
    response = HTTParty.get(url)
    return m.reply "Official Stream is currently live! twitch.tv/unrealengine" if response["stream"]
    m.reply "Official Stream is offline!"
  end

end
