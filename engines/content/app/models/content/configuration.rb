module Content
  class Configuration < ApplicationRecord
    attribute :remove_logo, :boolean # used by the form

    has_one_attached :logo
    belongs_to :account
  end
end
