require 'nokogiri'
require 'open-uri'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @products = []
    load_desktop3dprinter.each do |product|
      @products << product
    end
    load_goprint3d.each do |product|
      @products << product
    end
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
        name = element.css('.jb_category_title').text.strip
        price = element.css('.jb_category_price .selling_price').text.strip
        website = 'desktop3dprinter'
        unless name.nil? || name.empty?
          products << {name: name, price_vat: "NP", price_no_vat: price, website: website, url: page_url}
        end
      end
    end
    return products
  end

  def load_goprint3d
    url = "https://www.goprint3d.co.uk/brands/formlabs.html"
    products = []
    doc = Nokogiri::HTML(open(url))
    doc.css('.item').each do |element|
      name = element.css('.product-name').text.strip
      price_with_vat = element.css('.exvat > span').text.strip
      price_no_vat = element.css('.lowerprice50l > span').text.strip
      website = 'goprint3d'
      unless name.nil? || name.empty?
        products << {name: name, price_vat: price_with_vat, price_no_vat: price_no_vat, website: website, url: url}
      end
    end
    return products
  end
end
