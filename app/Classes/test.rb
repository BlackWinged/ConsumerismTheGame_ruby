def nokotest
  require 'open-uri'
  require 'nokogiri'
  doc = Nokogiri::HTML(open("http://google.com"))

  puts doc.inspect
end

nokotest