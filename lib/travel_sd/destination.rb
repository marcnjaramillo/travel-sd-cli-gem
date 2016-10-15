require 'pry'

class TravelSd::Destination
  attr_accessor :name, :bio

  @@all = []

  def self.new_from_index_page(a)
    self.new(
      a.css("h2").text,
      a.css("p.aresTextContent").text
      )
  end

  def initialize(name=nil, bio=nil)
    @name = name
    @bio = bio
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end
end
