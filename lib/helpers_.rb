# see http://nanoc.stoneship.org/docs/5-advanced-concepts/#writing-helpers
# see http://www.stuartellis.eu/articles/nanoc-notes/

include Nanoc3::Helpers::XMLSitemap
include NavigationHelper
include AchievementHelper

def create_sitemap
  # return unless @site.config[:output_generated_assets]

  @items.each do |item|
    if %w{png gif jpg jpeg coffee scss sass less css xml js json txt}.include?(item[:extension]) ||
        item.identifier =~ /403|404|500|htaccess/
      item[:is_hidden] = true unless item.attributes.has_key?(:is_hidden)
    end
  end
  @items << Nanoc3::Item.new(
    "=xml_sitemap :items => @items.reject{ |i| i[:is_hidden] || i.binary? }",
    { :extension => 'xml', :is_hidden => true },
    '/sitemap/'
  )
end

def create_json
  @items << Nanoc3::Item.new(
    "=json_feed",
    { :extension => 'json', :is_hidden => true },
    '/json/', {:binary => false}
  )
end
