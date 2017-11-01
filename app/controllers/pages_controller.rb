require 'nokogiri'
require 'open-uri'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @desktop3dprinter_products = []
    load_desktop3dprinter.each do |product|
      @desktop3dprinter_products << product
    end
    @goprint3d_products = []
    load_goprint3d.each do |product|
      @goprint3d_products << product
    end

    # @desktop3dprinter_products.sort_by! { |p| p["name"] }
    # @goprint3d_products.sort_by! { |p| p["name"] }

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
        name.slice!("Formlabs")
        price = element.css('.jb_category_price .selling_price').text.strip
        website = 'desktop3dprinter'
        unless name.nil? || name.empty?
          products << {name: name, price: price, website: website, url: page_url}
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
      name.slice!("Formlabs")
      price_with_vat = element.css('.exvat > span').text.strip
      website = 'goprint3d'
      unless name.nil? || name.empty?
        products << {name: name, price: price_with_vat, website: website, url: url}
      end
    end
    return products
  end
end
