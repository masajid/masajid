module Content
  class City < ApplicationRecord
    belongs_to :region
  end
end
