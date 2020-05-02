module Content
  class Slider < ApplicationRecord
    include Content::HasImage

    belongs_to :account
  end
end
