#!/usr/bin/env ruby

require 'yaml'

begin
  achievements = YAML.load(File.read('achievements.yml'))
  # puts achievements.inspect
  changed = false
  achievements.each do |ach|
    what = ach[:what]
    if ach[:tweet] == nil || ach[:tweet] == ''
      changed = true
      if what.length < 80
        ach[:tweet] = what
      else
        ach[:tweet] = 'MANUAL EDIT NEEDED'
      end
    end
  end
  if changed
    file = File.open('_achievements.yml', 'w')
    file.write(achievements.to_yaml)
  end
rescue => e
  puts e.message
  puts e.backtrace
  exit(1)
end
