module Content
  class Region < ApplicationRecord
    acts_as_copy_target

    belongs_to :country
    has_many :cities

    validates :name, presence: true
    validates :code, presence: true
    validates :adm1code, presence: true
    validates :country_id, presence: true
  end
end
