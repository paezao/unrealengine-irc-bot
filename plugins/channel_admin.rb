class ChannelAdmin
  include Cinch::Plugin

  @@owners = ["nkr"]
  @@admins = []

  match(/voice (.*)/,   method: :voice)
  match(/devoice (.*)/, method: :devoice)
  match(/op (.*)/,      method: :op)
  match(/deop (.*)/,    method: :deop)

  def is_owner?(user)
    return false unless user.authed?
    @@owners.include? user.to_s
  end

  def is_admin?(user)
    return false unless user.authed?
    @@admins.include? user.to_s
  end

  def voice(m, param)
    m.channel.voice(param) if is_owner?(m.user)
  end

  def devoice(m, param)
    m.channel.devoice(param) if is_owner?(m.user)
  end

  def op(m, param)
    m.channel.op(param) if is_owner?(m.user)
  end

  def deop(m, param)
    m.channel.deop(param) if is_owner?(m.user)
  end

end
