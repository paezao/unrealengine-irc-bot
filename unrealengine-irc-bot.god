God.watch do |w|
  w.name = "unrealengine-irc-bot"
  w.start = "ruby /home/unrealengine-irc-bot/app.rb"
  w.keepalive
end
