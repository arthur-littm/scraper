require 'open-uri'
require 'nokogiri'

# desktop3dprinter

# url = "http://www.desktop3dprinter.com/search/for/formlabs/page/"
# pages = ["1/", "2/"]
# products = []
# pages.each do |page|
#   page_url = url + page
#   doc = Nokogiri::HTML(open(page_url))
#   doc.css('.jb_category_holder').each do |element|
#     name = element.css('.jb_category_title').text.strip
#     price = element.css('.jb_category_price').text.strip
#     website = 'desktop3dprinter'
#     products << {name: name, price: price, website: website}
#   end
# end
# p products

# url = "https://www.goprint3d.co.uk/brands/formlabs.html"
# products = []
# doc = Nokogiri::HTML(open(url))
# doc.css('.item').each do |element|
#   name = element.css('.product-name').text.strip
#   price_with_vat = element.css('.exvat > span').text.strip
#   price_no_vat = element.css('.lowerprice50l > span').text.strip
#   website = 'desktop3dprinter'
#   products << {name: name, price_vat: price_with_vat, price_no_vat: price_no_vat, website: website}
# end
# p products





