module Content
  class Configuration < ApplicationRecord
    translates :about_us, fallbacks_for_empty_translations: true

    attribute :remove_logo, :boolean # used by the form

    has_one_attached :logo
    belongs_to :account

    accepts_nested_attributes_for :translations

    validates :admin_locale, inclusion: { in: :valid_locales }
    validates :default_locale, inclusion: { in: :valid_locales  }
    validate :check_supported_locales

    private

    def check_supported_locales
      errors.add(:supported_locales, :blank) if supported_locales.reject(&:blank?).blank?
    end

    def valid_locales
      supported_locales.reject(&:blank?)
    end
  end
end
