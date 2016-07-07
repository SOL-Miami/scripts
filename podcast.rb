require 'rubygems'
require 'awesome_print'
require 'nokogiri'
require 'open-uri'
require "mp3info"

url = 'http://podcast.solmiami.org/solcast_rss.xml'
doc = Nokogiri::HTML(open(url))
block = doc.xpath("//item")
chld_name = block.map do |node|
  node.children.map{|n| [n.name,n.text.strip] if n.elem? }.compact
  # enclosure_url = node.css("enclosure @url")
  # enclosure_length = node.css("enclosure @length")
  # enclosure_type = node.css("enclosure @type")
end.compact

a = chld_name.last
mp3 = a[2][1]
mp3_name = a[0][1].downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '') + '.mp3'
require 'debug'
download = open(mp3)
IO.copy_stream(download, "/Users/Mark/Desktop/#{mp3_name}")

Mp3Info.open("/Users/Mark/Desktop/#{mp3_name}") do |mp3info|
  require 'debug'
  puts mp3info
end

# title = doc.xpath("//item//title")
# link = doc.xpath("//item//link")
# guid = doc.xpath("//item//guid")
# description = doc.xpath("//item//decription")
# enclosure_url = doc.css("item enclosure @url")
# enclosure_length = doc.css("item enclosure @length")
# enclosure_type = doc.css("item enclosure @type")
# category = doc.xpath("//item//category")
# pubDate = doc.xpath("//item//pubDate")
# itunes_author = doc.xpath("//item//author")
# itunes_explicit = doc.xpath("//item//explicit")
# itunes_subtitle = doc.xpath("//item//subtitle")
# itunes_summary = doc.xpath("//item//summary")
# itunes_duration = doc.xpath("//item//duration")
# itunes_keywords = doc.xpath("//item//keywords")


puts doc
# .inner_text
