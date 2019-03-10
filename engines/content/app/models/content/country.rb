module Content
  class Country < ApplicationRecord
    acts_as_copy_target

    has_many :regions
    has_many :cities

    validates :name, presence: true
  end
end
