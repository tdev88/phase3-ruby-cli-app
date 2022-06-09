 

require_relative '../config/environment.rb' 
class CLI

  def initialize
    Scraper.new.make_horoscopes
  end

  def start 
    #Print list of signs and ask user to choose a sign for daily forecast 

    puts "\nWhat is your sign? Choose a number and press enter to view daily forecast." 
    puts "" 

    Horoscope.print_signs 
    index = gets.chomp.to_i
    p index
    url = Horoscope.get_weekly_url(index) 

    Horoscope.print_forecast(index) 

    #Ask user if they want weekly forecast 
    puts "" 
    puts "Would you like to see the weekly forecast? Y/N" 
    choice1 = gets.strip.downcase 

    if choice1 == "y" 
      Scraper_Weekly.new.print_weekly("#{url}") 
    elsif choice1 == "n" 
      puts "" 
      puts "Thank you! Bye!" 
      puts "" 
      exit 
    else 
      puts "" 
      puts "I don't understand that answer." 
      start 
    end 

    #Ask user if they want daily forecast for another sign 
    puts "\nWould you like to read another sign forecast? (Y/N)" 
    input = gets.strip.downcase 

    if input == "y" 
      Horoscope.reset_all 
      start 
    elsif input == "n" 
      puts "" 
      puts "Thank you! Bye!" 
      puts "" 
      exit 
    else 
      puts "" 
      puts "I don't understand that answer." 
       
      start 
    end 

  end 
end  