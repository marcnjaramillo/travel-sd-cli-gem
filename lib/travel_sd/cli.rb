class TravelSd::CLI

  def call
    puts "Plan your perfect San Diego getaway!"
    destinations
  end

  def destinations
  puts "Top 30 San Diego Attractions:"
  #Pull destination types from the website and list them
  @first_list = TravelSd::Destination.first
  #Currently not producing expected result of eliminating duplicate data
  @first_list.each do |destination|
    puts "#{destination.name}"
  end
    puts "Enter the number of the destination you want more info on or enter next
    to see more destinations"
    puts "If you are finished, enter exit to leave the program."
  end
end
