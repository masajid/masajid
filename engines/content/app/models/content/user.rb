module Content
  class User < ApplicationRecord
    devise :database_authenticatable, :async, :recoverable, :rememberable, :validatable, :trackable, :confirmable

    ROLE_NAMES = %w[super_admin admin user].freeze

    has_one :account, foreign_key: :owner_id

    validates :role, inclusion: { in: ROLE_NAMES }

    before_validation :set_authentication_token, if: :generate_authentication_token

    attribute :generate_authentication_token, :boolean

    ROLE_NAMES.each do |role_name|
      define_method "#{role_name}?" do
        role == role_name
      end
    end

    def active_for_authentication?
      approval_needed? ? false : super
    end

    def inactive_message
      approval_needed? ? :not_approved : super
    end

    private

    def set_authentication_token
      self.authentication_token = Devise.friendly_token
    end

    def approval_needed?
      admin? && !account.accepted?
    end
  end
end
