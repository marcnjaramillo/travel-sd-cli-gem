class TravelSd::Scraper

  def self.scrape_attractions
    sites = Nokogiri::HTML(open("http://hotels.sandiego.org/attraction/list/246/m24?page=1")).css("div.aresAttractionOverview")
    sites.each do |a|
      TravelSd::Destination.new({
        name: a.css("h2").text,
        bio: a.css("p.aresTextContent").text
      })
    end
  end

end
