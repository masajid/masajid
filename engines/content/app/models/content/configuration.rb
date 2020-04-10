module Content
  class Configuration < ApplicationRecord
    has_one_attached :logo

    belongs_to :account
  end
end
