namespace :content_places do
  include ActionView::Helpers::DateHelper

  desc 'Import all data'
  task import: :environment do
    puts 'Please wait! this will take some minutes ........'
    start_time = Time.now

    Content::Country.copy_from("#{Rails.root}/data/places/countries.txt")
    Content::Region.copy_from("#{Rails.root}/data/places/regions.txt")
    Content::City.copy_from("#{Rails.root}/data/places/cities.txt")

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