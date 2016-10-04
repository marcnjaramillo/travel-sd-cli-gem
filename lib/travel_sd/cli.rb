class TravelSd::CLI

  def call
    puts "Plan your perfect San Diego getaway!"
    destinations
  end

  def destinations
  puts "Top San Diego Attractions:"
  #Pull destination types from the website and list them
  @destinations = TravelSd::Destination.current
  #Currently not producing expected result of eliminating duplicate data
  @destinations.each do |destination|
    puts "#{destination.name}"
  end
end
end
