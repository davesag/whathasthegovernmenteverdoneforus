include Nanoc3::Helpers::LinkTo

module AchievementHelper

  # return a list of any 'project_details' items.
  def achievements
    @items.select { |i| i.identifier.start_with? '/achievement_details/' }
  end

  def json_feed(params = {})
    require 'json'
    items = achievements
    result = {}
    items.each do |ach|
      result[ach[:code]] = {
        :what => ach[:what].gsub(/\n/, ' '),
        :benefit => ach[:benefit].gsub(/\n/, ' '),
        :url => ach[:url]
      }
    end
    {:created_at => Time.now.utc,
     :count => items.size,
     :achievements => result}.to_json
  end
end
