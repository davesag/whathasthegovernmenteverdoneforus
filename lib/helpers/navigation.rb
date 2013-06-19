include Nanoc3::Helpers::LinkTo

module NavigationHelper

  # the navigation items in order.
  # if you add content you must add it to this array.
  NAV_ITEMS = ['/', '/romans/', '/developers/']

  def menu_item(text, target, attributes= {})
    # puts "#{text}, #{target}, #{attributes.inspect}"
    link = link_to(text, target, attributes)
    return "<li>#{link}</li>"
  end

  # Build an html list with links to the other content items.
  def navigation
    result = '<ul class="nav nav-pills pull-right">'
    NAV_ITEMS.each do |it|
      item = @items.find { |i| i.identifier == it }
      result << menu_item(item[:title], item.reps[0].path, :title => item[:heading]) unless item == nil
    end
    result << '</ul>'

    return result
  end

end
