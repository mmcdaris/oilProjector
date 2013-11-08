require 'watir-webdriver'

barrels = nil
puts "browser opening"
b = Watir::Browser.new
puts "getting the page"
b.goto "http://www.worldometers.info/"
print "the number of barrels left is: "
texts = b.text.split("\n")
texts.each_with_index do |line, index|
  if line.include?("Oil left \(barrels\)")  
    barrels = texts[(index-1)].gsub!(",", "").to_i
  end  
end
puts barrels

File.write('./barrels', barrels)
puts "browser closing!"
b.close
