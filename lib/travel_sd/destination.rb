require 'pry'

class TravelSd::Destination
  attr_accessor :name, :bio

  @@all = []

  def initialize(attributes = {})
    @name = attributes[:name]
    @bio = attributes[:bio]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end
end
