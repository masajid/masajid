namespace :content_places do
  include ActionView::Helpers::DateHelper

  desc 'Import all data'
  task import: :environment do
    puts 'Please wait! this will take some minutes ........'
    start_time = Time.now

    tags = ENV['only']&.split(',') || []

    Content::Country.copy_from("#{Content::Engine.root}/data/places/countries.txt") if tags.include?('countries')
    Content::Region.copy_from("#{Content::Engine.root}/data/places/regions.txt") if tags.include?('regions')
    Content::City.copy_from("#{Content::Engine.root}/data/places/cities.txt") if tags.include?('cities')

    end_time = Time.now
    total_time = distance_of_time_in_words(end_time - start_time)
    show_statistics
    puts "Script total time execution: #{total_time}."
  end

  desc 'Show statistics'
  task statistics: :environment do
    show_statistics
  end

  def show_statistics
    puts "Total countries: #{Content::Country.count}"
    puts "Total regions: #{Content::Region.count}"
    puts "Total cities: #{Content::City.count}"
  end
end
