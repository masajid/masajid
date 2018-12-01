module Content
  class Role < ApplicationRecord
    ROLE_NAMES = %w[super_admin admin user]

    validates :name, uniqueness: true, inclusion: { in: ROLE_NAMES }
  end
end
