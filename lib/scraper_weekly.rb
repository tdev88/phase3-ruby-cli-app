require_relative '../config/environment.rb' 

class Scraper_Weekly 

  def get_weekly(url) 
    Nokogiri::HTML(open("#{url}")) 
  end 

  def print_weekly(url) 
    puts self.get_weekly("#{url}").css(".dailyhoroscope").css("p").text 
  end 

end   