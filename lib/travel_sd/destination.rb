class TravelSd::Destination
  attr_accessor :name

  def self.current
    self.destination_type
  end

  def self.destination_type
    destinations = []
    destinations << self.scrape_destinations
    destinations
  end

  def self.scrape_destinations
    doc = Nokogiri::HTML(open("http://hotels.sandiego.org/attraction/list/246/"))



    destination = self.new
    destination.name = doc.search("h2[itemprop='name']").text.strip

    destination
  end

end
