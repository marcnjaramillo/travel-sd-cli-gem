class TravelSd::Scraper

  def index_page
    Nokogiri::HTML(open("http://hotels.sandiego.org/attraction/list/246/m24?page=1"))
  end

  def scrape_attractions_index
    self.index_page.css("div.aresAttractionOverview")
  end

  def all_attractions
    scrape_attractions_index.each do |a|
      TravelSd::Destination.new_from_index_page(a)
    end
  end
end
