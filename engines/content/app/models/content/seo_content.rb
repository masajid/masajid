module Content
  class SeoContent < ApplicationRecord
    translates :meta_title, :meta_keywords, :meta_description

    belongs_to :searchable, polymorphic: true
    validates :searchable, presence: true

    accepts_nested_attributes_for :translations
  end
end
