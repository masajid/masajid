module Content
  class Configuration < ApplicationRecord
    has_one_attached :logo

    THEME_OPTIONS = %w[cerulean cosmo flatly journal litera lumen lux minty pulse sandstone simplex spacelab united yeti]

    belongs_to :account

    before_validation :set_theme

    private

    def set_theme
      self.theme ||= :united
    end
  end
end
