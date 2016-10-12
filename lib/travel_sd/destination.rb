require 'pry'

class TravelSd::Destination
  attr_accessor :name, :specials

  def initialize(name = nil)
    @name = name
  end

  def self.all
    @@all ||= scrape_first
  end

  def self.find(id)
    self.all[id-1]
  end

  def specials
    doc = Nokogiri::HTML(open("http://hotels.sandiego.org/attraction/list/246/m24?page=1"))
    @specials ||= doc.search("div.aresDealTextInner p").text.strip
  end

  private
    def self.scrape_first
      doc = Nokogiri::HTML(open("http://hotels.sandiego.org/attraction/list/246/m24?page=1"))
      places = doc.search("h2[itemprop='name']")

      places.collect{|name| new(name.text.strip)}
    end
end
