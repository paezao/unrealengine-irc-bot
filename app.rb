require 'cinch'
require 'cinch/toolbox'
require 'cinch/cooldown'
require 'httparty'
require './plugins/channel_admin'
require './plugins/unrealdocs'
require './plugins/ueschool'
require './plugins/officialstream'
require './plugins/greenlight'
require './plugins/streams'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = 'chat.freenode.org'
    c.password = ENV['UE_IRC_PASSWORD']
    c.channels = ['#unrealengine', '#netherdeep', '#ue4linux']
    c.nick = 'UnrealEngine'
    c.plugins.plugins = [ChannelAdmin, UnrealDocs, UESchool, OfficialStream, Greenlight, Streams]
  end
end

bot.start
