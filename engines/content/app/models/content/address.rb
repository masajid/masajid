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
    validates :addressable, presence: true
    validates :country_id, presence: true
    validates :region_id, presence: true
    validates :city_id, presence: true
  end
end