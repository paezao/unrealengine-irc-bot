class UESchool
  include Cinch::Plugin

  match /(ueschool)/

  def execute(m)
    url = "https://api.twitch.tv/kraken/streams/ueschool"
    response = HTTParty.get(url)
    return m.reply "Stream is currently live! twitch.tv/ueschool" if response["stream"]
    m.reply "Unreal Engine School is offline!"
  end

end
