class TravelSd::CLI

  def call
    puts "Plan your perfect San Diego getaway!"
    puts "Here are the top 10 San Diego Attractions:"
    destinations
    cli_menu
  end

  def destinations
    puts ""
    puts "--------------------"
    @first_list = TravelSd::Destination.all.each do |destination|
      puts "#{destination.name}"
    end
      puts "--------------------"
  end

  def full_destination(destination)
    puts ""
    puts "-------------- #{destination.name} --------------"

    puts ""
    puts "Special Offer: #{destination.specials}"
    puts ""
    binding.pry
  end

  def cli_menu
    input = nil
      puts "Enter the number of the destination you want more info for."
      puts "You may type exit to leave the program at any time."
    while input != "exit"
      input = gets.strip.downcase
      if input == "top list"
        destinations
      elsif input.to_i > 0
        if destination = TravelSd::Destination.find(input.to_i)
          full_destination(destination)
        end
        puts "Enter the number of another destination, or top list to return to the destination listings."
        puts "If you are finished, type exit."

      elsif input == "exit"
        puts ""
        puts "Enjoy your sightseeing adventure in San Diego! Come again!"

      else
        puts "Invalid input. Available choices: destination number, top list or exit."
      end
    end
  end
end
