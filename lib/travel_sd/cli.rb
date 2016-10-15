class TravelSd::CLI

  def call
    TravelSd::Scraper.new.all_attractions
    puts "Plan your perfect San Diego getaway!"
    puts "Here are the top 10 San Diego Attractions:"
    destinations
    cli_menu
  end

  def destinations
    puts ""
    puts "--------------------"
    TravelSd::Destination.all.each.with_index(1) do |destination, index|
      puts "#{index}. #{destination.name}"
    end
      puts "--------------------"
  end

  def full_destination(destination)
    puts ""
    puts "------------"
    puts "Destination"
    puts "------------"
    puts destination.name

    puts ""
    puts "------"
    puts "About"
    puts "------"
    puts destination.bio
    puts ""
    puts "___________________________________________________________________________________________"

  end

  def cli_menu
    input = nil
      puts "Enter the number of the destination you want more info for."
      puts "You may type exit to leave the program at any time."
    while input != "exit"
      input = gets.strip.downcase
      if input == "list"
        destinations
      elsif input.to_i > 0
        if destination = TravelSd::Destination.find(input.to_i)
          full_destination(destination)
        end
        puts ""
        puts "Enter the number of another destination, or list to return to the destination listings."
        puts "If you are finished, type exit."

      elsif input == "exit"
        puts ""
        puts "Enjoy your sightseeing adventure in San Diego! Come again!"

      else
        puts "Invalid input. Available choices: destination number, list or exit."
      end
    end
  end
end
