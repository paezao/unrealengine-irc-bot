class Cinch::ChannelAdmin
  include Cinch::Plugin

  @owners = ["nkr"]

  def self.is_owner?(user)
    return false unless user.authed?
    @owners.include? user.to_s
  end

  def self.is_admin?(user)
    return false unless user.authed?
    @admins.include? user.to_s
  end
end
