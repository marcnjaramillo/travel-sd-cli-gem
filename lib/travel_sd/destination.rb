class TravelSd::Destination
  attr_accessor :name, :special

  def self.first
    self.first_list
  end

  def self.second
    self.second_list
  end

  def self.third
    self.third_list
  end

  def self.find(id)
    self.first[id-1]
  end

  def self.first_list
    first_list = []
    first_list << self.scrape_first
    first_list
  end

  def self.second_list
    second_list = []
    second_list << self.scrape_second
    second_list
  end

  def self.third_list
    third_list = []
    third_list << self.scrape_third
    third_list
  end

  def self.scrape_first
    doc = Nokogiri::HTML(open("http://hotels.sandiego.org/attraction/list/246/m24?page=1"))
    place = doc.search("h2[itemprop='name']")
    deal = doc.search("div.aresDealTextInner p")

    destination = self.new
    destination.name = place.map(&:text).join("\n")
    destination.special = deal.map(&:text).join("\n")
    destination
  end

  def self.scrape_second
    doc = Nokogiri::HTML(open("http://hotels.sandiego.org/attraction/list/246/m24?page=2"))
    place = doc.search("h2[itemprop='name']")

    destination = self.new
    destination.name = place.map(&:text).join("\n")

    destination
  end

  def self.scrape_third
    doc = Nokogiri::HTML(open("http://hotels.sandiego.org/attraction/list/246/m24?page=3"))
    place = doc.search("h2[itemprop='name']")

    destination = self.new
    destination.name = place.map(&:text).join("\n")

    destination
  end

end
