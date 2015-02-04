God.watch do |w|
  w.name = "unrealengine-irc-bot"
  w.start = "ruby /home/app/unrealengine-irc-bot/app.rb"
  w.keepalive
end
