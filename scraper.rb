require 'Nokogiri'
require 'open-uri'

url = 'https://www.eldersweather.com.au/local-forecast/nsw/narrandera'
html = URI.open(url)
doc = Nokogiri::HTML(html)

puts doc
