class Greenlight
  include Cinch::Plugin

  @@projects = [
    { name: "Exodus", url: "http://steamcommunity.com/sharedfiles/filedetails/?id=264273221", by: "Bob_Gneu & ReqPro" }
  ]

  match "greenlight"

  def execute(m)
    @@projects.each do |project|
      m.reply "UE4 Project on Greenlight: #{project[:name]} by #{project[:by]} - Vote @ #{Cinch::Toolbox.shorten(project[:url])}"
    end
  end
end
