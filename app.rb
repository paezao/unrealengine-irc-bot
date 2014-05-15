require 'cinch'
require 'httparty'
require 'plugins/channel_admin'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = 'chat.freenode.org'
    c.password = ENV['UE_IRC_PASSWORD']
    c.channels = ['#unrealengine']
    c.nick = 'UnrealEngine'
    c.plugins.plugins = [ChannelAdmin]
  end

  helpers do
  end
end

bot.start
