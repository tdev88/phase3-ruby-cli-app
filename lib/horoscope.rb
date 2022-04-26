class Horoscope 

  attr_accessor :sign, :forecast, :index, :url 

  @@all = [] 

  def initialize 
    @@all << self 
  end 

  def self.all 
    @@all 
  end 

  def self.reset_all 
    @@all.clear 
  end 

  def self.find_by_index(index) 
    self.all.find{|h| h.index == "#{index}"} 
  end 

  def self.print_forecast(index) 
    puts self.find_by_index("#{index}").forecast.chomp("Need more insight?") 
  end 

  def self.get_weekly_url(index) 
    self.find_by_index("#{index}").url 
  end 

end 