include Nanoc3::Helpers::LinkTo

module AchievementHelper

  # return a list of any 'project_details' items.
  def achievements
    @items.select { |i| i.identifier.start_with? '/achievement_details/' }
  end

  def achievements_with_photos
    @items.select { |i| i.identifier.start_with?('/achievement_details/') && i[:photo] != nil}
  end
end
