module Content
  class Address < ApplicationRecord
    belongs_to :addressable, polymorphic: true
    belongs_to :country
    belongs_to :region
    belongs_to :city

    validates :first_name, length: { maximum: 50 }
    validates :last_name, length: { maximum: 50 }
    validates :phone, presence: true, length: { maximum: 20 }
    validates :fax, length: { maximum: 20 }
    validates :address1, presence: true
    validates :fax, length: { maximum: 20 }
    validates :zip_code, length: { maximum: 20 }
    validates :city_name, presence: true, length: { maximum: 100 }
    validates :region_name, presence: true, length: { maximum: 100 }
    validates :addressable, presence: true
    validates :country_id, presence: true

    before_validation :set_city_name, :set_region_name

    private

    def set_city_name
      self.city_name = city.name if city
    end

    def set_region_name
      self.region_name = region.name if region
    end
  end
end
