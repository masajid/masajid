module Content
  class Slider < ApplicationRecord
    include Content::HasPhoto
    translates :title, :body, :link, :link_text, fallbacks_for_empty_translations: true

    belongs_to :account

    accepts_nested_attributes_for :translations
  end
end
