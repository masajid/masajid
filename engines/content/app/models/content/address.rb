module Content
  class Address < ApplicationRecord
    belongs_to :city, foreign_key: :content_city_id
    belongs_to :region, foreign_key: :content_region_id
    belongs_to :country, foreign_key: :content_country_id

    validates :street, presence: true
    validates :content_city_id, presence: true
    validates :content_region_id, presence: true
    validates :content_country_id, presence: true
  end
end
