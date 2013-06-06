# -*- encoding : utf-8 -*-

namespace :white_data do

  desc "load roads data"
  task :load_roads => :environment do
    puts "Start load roads data"
    # truncate roads
    ActiveRecord::Base.connection.execute("TRUNCATE roads")

    file = File.open("doc/roads.txt")
    file.each_with_index do |line, index|
      name = line.gsub("\n",'')
      Road.create(name: name)
    end

    puts "End load roads data"
  end

  desc "load areas data"
  task :load_areas => :environment do
    puts "Start load areas data"
    # truncate areas
    ActiveRecord::Base.connection.execute("TRUNCATE areas")

    file = File.open("doc/areas.txt")
    file.each_with_index do |line, index|
      name = line.gsub("\n",'')
      Area.create(name: name)
    end

    puts "End load areas data"
  end

  desc "load words data"
  task :load_words => :environment do
    puts "Start load words data"
    # truncate words
    ActiveRecord::Base.connection.execute("TRUNCATE words")

    file = File.open("doc/words.txt")
    file.each_with_index do |line, index|
      name = line.gsub("\n",'')
      Word.create(name: name)
    end

    puts "End load words data"
  end

end
