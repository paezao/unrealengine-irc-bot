class UnrealDocs
  include Cinch::Plugin

  enforce_cooldown

  match /(docs|wiki|answers|api|forums|documentation) (.*)/

  def execute(m, type, term)
    m.reply docs(type, term)
  end

  private

  def docs(type, term)
    page = Nokogiri.HTML(open(get_url type, term))

    found = page.css('ul li').first
    return "Ooops! Can't find anything with #{term}!" if !found.nil? && found.content == "Make sure all words are spelled correctly."

    element = page.css('li a').first
    title = element.content
    url = element['href']
    url  = Cinch::Toolbox.shorten(url)
    text = page.css('li span').first.content

    "#{type}: #{title} - #{text} [ #{url} ]"
  end

  def get_url(type, term)
    type = "all" if type == "docs"
    search = "#{term} more:#{type}"
    "https://www.google.com/cse?q=#{URI.escape(search, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))}&cx=009868829633250020713:y7tfd8hlcgg&nojs=1"
  end
end
