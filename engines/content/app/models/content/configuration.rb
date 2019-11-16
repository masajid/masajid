module Content
  class Configuration < ApplicationRecord
    has_one_attached :logo

    THEME_OPTIONS = %w[default cerulean cosmo flatly journal litera lumen lux minty pulse sandstone simplex spacelab united yeti].freeze

    belongs_to :account

    validates :mawaqit_link, format: { with: /\Ahttps:\/\/mawaqit.net\//i }, allow_blank: true
    validate :correct_mawaqit_link, if: -> { mawaqit_link_changed? && mawaqit_link.present? && errors.blank? }

    private

    def correct_mawaqit_link
      url = URI.parse(mawaqit_link)
      req = Net::HTTP.new(url.host, url.port)
      req.use_ssl = true
      res = req.request_head(url.path)
      errors.add(:mawaqit_link, :invalid) unless res.code.to_i == 200
    end
  end
end
