require_relative '../config/environment.rb' 

class Scraper 
  #get html content from url 
  def get_page 
    Nokogiri::HTML(open("https://www.absolutesoulsecrets.com/horoscopes/free-horoscopes/")) 
  end 

  #use css selector to narrow down HTML content to be used for the sign and forecast variables 
  def get_horoscopes 
    self.get_page.css(".dailyhoroscope") 
  end 

  #use css selectors to get sign and forecast for each horoscope and create objects 
  def make_horoscopes 
    self.get_horoscopes.map.with_index do |zodiac, index| 
      horoscope = Horoscope.new                                              
      horoscope.sign = zodiac.css(".horo-title").text 
      horoscope.forecast = zodiac.css("p").text 
      horoscope.index = "#{index}" 
      horoscope.url = zodiac.css("a").first["href"] 
      horoscope 
    end   
  end 

  

end 