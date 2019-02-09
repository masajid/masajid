module Content
  class User < ApplicationRecord
    devise :database_authenticatable, :recoverable, :rememberable, :validatable, :trackable, :confirmable

    ROLE_NAMES = %w[super_admin admin user]

    validates :role, inclusion: { in: ROLE_NAMES }

    ROLE_NAMES.each do |role_name|
      define_method "#{role_name}?" do
        role == role_name
      end
    end
  end
end
