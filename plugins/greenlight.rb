class Greenlight
  include Cinch::Plugin

  @@projects = [
    { name: "Spellsworn", url: "http://steamcommunity.com/sharedfiles/filedetails/?id=385795837", by: "Omberone" },
    { name: "Exodus", url: "http://steamcommunity.com/sharedfiles/filedetails/?id=264273221", by: "Bob_Gneu & ReqPro" },
    { name: "Barrage", url: "http://steamcommunity.com//sharedfiles/filedetails/?id=414409258", by: "Daekesh" },
    { name: "Vortex", url: "http://steamcommunity.com/sharedfiles/filedetails/?id=424753403", by: "k8nn" },
    { name: "Descent: Underground", url: "https://steamcommunity.com/sharedfiles/filedetails/?id=412870542", by: "Stormwind" }
  ]

  match "greenlight"

  def execute(m)
    @@projects.each do |project|
      m.reply "UE4 Project on Greenlight: #{project[:name]} by #{project[:by]} - Vote @ #{Cinch::Toolbox.shorten(project[:url])}"
    end
  end
end
