class ProjectsDataSource < Nanoc::DataSource
  identifier :achievements
  # (other code here) - see http://nanoc.ws/docs/extending-nanoc/
  attr_reader :achievement_list

  def up
    # read in the data from the projects.yml file
    raise RuntimeError, "Could not file './achievements.yml'" unless File.exists?('./achievements.yml')
    @achievement_list = YAML.load(File.read('./achievements.yml'))
  end

  def items
    @achievement_list.map do |ach|
      Nanoc3::Item.new(
        ach[:code],
        {
          :code => ach[:code],
          :what => ach[:what],
          :benefit => ach[:benefit],
          :photo => ach[:photo],
          :url => ach[:url]
        },
        "/achievement_details/#{ach[:code]}",
        {:binary => false}
      )
    end
  end
end
