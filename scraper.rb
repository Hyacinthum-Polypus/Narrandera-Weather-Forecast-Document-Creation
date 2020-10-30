require 'Nokogiri'
require 'open-uri'



def FixImages(body, url)
  return body = body.gsub(/src../, " src=\"#{url}")
end

def RemoveListItems(body)
  body = body.gsub(/<li([^>])+>/, "")
  return body.gsub(/<\/li>/, "")
end

url = 'https://www.eldersweather.com.au/local-forecast/nsw/narrandera'
html = URI.open(url)
doc = Nokogiri::HTML(html)

sevenDayForecast = doc.css("li.seven-day-forecast.full")
sunRiseSunSet = doc.css("li.sunrise-sunset.full")

content = "<html><head>  <style type=\"text/css\">table, th, td {border: 1px solid black;} </style> </head><body>" + sevenDayForecast.to_s() + sunRiseSunSet.to_s()  + "</body></html>"

content = FixImages(content, "https://www.eldersweather.com.au")

content = RemoveListItems(content)

puts content

File.open("#{Dir.home}/Desktop/Forecast.html", "w") { |f| f.write "#{content}"}
