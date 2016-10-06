class TravelSd::CLI

  def call
    puts "Plan your perfect San Diego getaway!"
    puts "Here are the top 30 San Diego Attractions:"
    destinations
    cli_menu
  end

  def full_destination(destination)
    puts ""
    puts "-------------- #{destination.name} --------------"

    puts ""
    puts "Special Offer: #{destination.special}"
    puts ""

    #puts "Where: #{destination.place}"
    #puts ""
  end

  def destinations
    puts ""
    puts "#1 - 10:"
    puts "--------------------"
    @first_list = TravelSd::Destination.first
    @first_list.each do |destination|
      puts "#{destination.name}"
      puts "--------------------"
    end
  end

  def cli_menu
    input = nil
      puts "Enter the number of the destination you want more info for."
      puts "Enter list two or list three to see more destinations."
      puts "You may type exit to leave the program at any time."
    while input != "exit"
      input = gets.strip.downcase
      if input == "top list"
        destinations
      elsif input.to_i > 0
        if destination = TravelSd::Destination.find(input.to_i)
          full_destination(destination)
        end
        puts "Enter top list, list two, or list three to return to the destination listings."
        puts "If you are finished, type exit."

      elsif input == "list two"
        puts ""
        puts "#11 - 20:"
        puts "--------------------"
        @second_list = TravelSd::Destination.second
        @second_list.each do |destination|
          puts "#{destination.name}"
          puts "--------------------"
        end
          puts "Enter the number of the destination you want more info for."
          puts "Enter list three to see the final list of destinations."
          puts "Enter top list to return to the first list, or type exit to leave the program."
          puts ""

      elsif input == "list three"
        puts ""
        puts "#21 - 30:"
        puts "--------------------"
        @third_list = TravelSd::Destination.third
        @third_list.each do |destination|
          puts "#{destination.name}"
          puts "--------------------"
        end
          puts "Enter the number of the destination you want more info for."
          puts "Enter top list to return to the first list, or second list to see the second list."
          puts "Type exit to leave the program."
          puts ""

      elsif input == "exit"
        puts ""
        puts "Enjoy your sightseeing adventure in San Diego! Come again!"

      else
        puts "Invalid input. Available choices: destination number, top list, list two, list three, exit."
      end
    end
  end
end
