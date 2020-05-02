module Content
  class Configuration < ApplicationRecord
    attr_accessor :remove_logo

    has_one_attached :logo
    belongs_to :account
  end
end
