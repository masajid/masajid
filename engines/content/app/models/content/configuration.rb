module Content
  class Configuration < ApplicationRecord
    has_one_attached :logo

    THEME_OPTIONS = %w[default cerulean cosmo flatly journal litera lumen lux minty pulse sandstone simplex spacelab united yeti]

    belongs_to :account
  end
end
