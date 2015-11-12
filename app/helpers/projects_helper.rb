module ProjectsHelper
  require 'fastimage'
  require 'nokogiri'
  require 'open-uri'

  def updateImageSizes(description)
    article = Nokogiri::HTML.fragment(description)

    article.css('img').each do |img|
      width, height = FastImage.size(img.get_attribute('src'))
      img.set_attribute('data-size', "[#{width}, #{height}]")
      img.set_attribute('data-height', "#{height}px")
      img.set_attribute('data-width', "#{width}px")
    end

    return article.to_s
  end

end
