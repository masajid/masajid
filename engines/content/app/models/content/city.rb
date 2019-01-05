module Content
  class City < ApplicationRecord
    acts_as_copy_target

    belongs_to :country
    belongs_to :region

    validates :name, presence: true
    validates :longitude, presence: true
    validates :latitude, presence: true
    validates :timezone, presence: true
    validates :country, presence: true
    validates :region, presence: true
  end
end
