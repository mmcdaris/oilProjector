require 'watir-webdriver'

barrels = nil
b = Watir::Browser.new
b.goto "http://www.worldometers.info/"
texts = b.text.split("\n")
texts.each_with_index do |line, index|
  if line.include?("Oil left \(barrels\)")  
    barrels = texts[(index-1)].gsub!(",", "").to_i
  end  
end


