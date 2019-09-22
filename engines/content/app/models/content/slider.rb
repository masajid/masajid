module Content
  class Slider < ApplicationRecord
    has_one_attached :photo

    belongs_to :account
  end
end
