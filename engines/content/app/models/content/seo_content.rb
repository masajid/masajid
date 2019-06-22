module Content
  class SeoContent < ApplicationRecord
    belongs_to :searchable, polymorphic: true

    validates :searchable, presence: true
  end
end
