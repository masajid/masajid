module Content
  class Configuration < ApplicationRecord
    translates :about_us, fallbacks_for_empty_translations: true

    has_one_attached :logo
    belongs_to :account

    accepts_nested_attributes_for :translations
  end
end
