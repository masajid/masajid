namespace :content_places do
  include ActionView::Helpers::DateHelper

  desc 'Import all data'
  task import: :environment do
    puts 'Please wait! this will take some minutes ........'
    start_time = Time.now

    import_countries
    import_regions
    import_cities

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

  def import_countries
    countries_file = "#{Rails.root}/data/places/countries.txt"
    Content::Country.copy_from countries_file, :map => {
        'CountryId' => 'id',
        'Country' => 'name',
        'FIPS104' => 'fips104',
        'ISO2' => 'iso2',
        'ISO3' => 'iso3',
        'ISON' => 'ison',
        'Internet' => 'internet',
        'Capital' => 'capital',
        'MapReference' => 'map_reference',
        'NationalitySingular' => 'nationality_singular',
        'NationalityPlural' => 'nationality_plural',
        'Currency' => 'currency',
        'CurrencyCode' => 'currency_code',
        'Population' => 'population',
        'Title' => 'title',
        'Comment' => 'comment'
    }
  end

  def import_regions
    regions_file = "#{Rails.root}/data/places/regions.txt"
    Content::Region.copy_from regions_file, :map => {
        'RegionId' => 'id',
        'CountryId' => 'country_id',
        'Region' => 'name',
        'Code' => 'code',
        'ADM1Code' => 'adm1code'
    }
  end

  def import_cities
    cities_file = "#{Rails.root}/data/places/cities.txt"
    Content::City.copy_from cities_file, :map => {
        'CityId' => 'id',
        'CountryID' => 'country_id',
        'RegionID' => 'region_id',
        'City' => 'name',
        'Latitude' => 'latitude',
        'Longitude' => 'longitude',
        'TimeZone' => 'timezone',
        'DmaId' => 'dma_id',
        'Code' => 'code'
    }
  end

  def import_file_to_pg_db(db_name, file_name, columns)
    # Setup raw connection
    conn = ActiveRecord::Base.connection
    rc = conn.raw_connection
    rc.exec("COPY #{db_name} (#{columns}) FROM STDIN WITH CSV")

    file = File.open(file_name, 'r')
    while !file.eof?
      # Add row to copy data
      rc.put_copy_data(file.readline)
    end

    # Adding done, time to copy data
    rc.put_copy_end

    # Display any error messages
    while res = rc.get_result
      if e_message = res.error_message
        p e_message
      end
    end
  end

end