module Content
  class Slider < ApplicationRecord
    include Content::HasPhoto

    belongs_to :account
  end
end
