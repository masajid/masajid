module Content
  class Country < ApplicationRecord
    acts_as_copy_target

    has_many :regions
    has_many :cities

    validates :name, presence: true
    validates :fips104, presence: true
    validates :iso2, presence: true
    validates :iso3, presence: true
    validates :ison, presence: true
    validates :internet, presence: true
  end
end
