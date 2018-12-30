module Content
  class Address < ApplicationRecord
    belongs_to :city, foreign_key: :content_city_id
    belongs_to :region, foreign_key: :content_region_id
    belongs_to :country, foreign_key: :content_country_id

    validates :city, presence: true
    validates :region, presence: true
    validates :country, presence: true
  end
end
