require 'net/http'
require "nokogiri"

store = Net::HTTP.get(URI('https://loja.marazulreceptivo.com.br/facebook-ads.xml'))

#puts doc

xml = Nokogiri::XML(store)
#puts xml.xpath("//item").inspect

xml.xpath("//item").each do |item|
    puts item.xpath('g:id').text
    puts item.xpath('g:title').text
end
#doc.each("item") do |item|
#    puts item
#end