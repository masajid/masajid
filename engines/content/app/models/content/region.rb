module Content
  class Region < ApplicationRecord
    belongs_to :country
  end
end
