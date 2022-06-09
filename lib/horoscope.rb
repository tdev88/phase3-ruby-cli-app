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
    self.all.clear 
  end 

  #print list of signs 
  def self.print_signs 
    self.all.each.with_index(1) do |horoscope, index| 
    puts "#{index}. #{horoscope.sign}" 
    end   
  end 

  def self.find_by_index(index) 
    self.all[index] 
  end 

  def self.print_forecast(index)
    starsign =  self.find_by_index(index)
    puts starsign.sign
    puts starsign.forecast.chomp("Need more insight?") 
  end 

  def self.get_weekly_url(index) 
    self.find_by_index(index).url 
  end 

end 