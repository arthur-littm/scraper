require 'nokogiri'
require 'open-uri'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @products = load_desktop3dprinter
  end

  private

  def load_desktop3dprinter
    url = "http://www.desktop3dprinter.com/search/for/formlabs/page/"
    pages = ["1/", "2/"]
    products = []
    pages.each do |page|
      page_url = url + page
      doc = Nokogiri::HTML(open(page_url))
      doc.css('.jb_category_holder').each do |element|
        name = element.css('jb_category_title').text.strip
        price = element.css('jb_category_price').text.strip
        website = 'desktop3dprinter'
        products << {name: name, price: price, website: website}
      end
    end
    return products
  end
end
