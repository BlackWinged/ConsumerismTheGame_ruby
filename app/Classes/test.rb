def nokotest
  require 'open-uri'
  doc = Nokogiri::HTML(open("http://google.com"))
end