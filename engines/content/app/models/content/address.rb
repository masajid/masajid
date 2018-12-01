module Content
  class Address < ApplicationRecord
    belongs_to :city
    belongs_to :region
    belongs_to :country
  end
end
