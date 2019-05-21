module Content
  class Account < ApplicationRecord
    belongs_to :owner, class_name: 'Content::User'
    has_one :address, as: :addressable
    has_one :configuration
    has_one :slider
    has_one :social_network

    enum status: %i[pending accepted declined]

    validates :subdomain, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :mosque, presence: true
    validates :responsable, presence: true
    validates :owner, presence: true
    validates :address, presence: true

    accepts_nested_attributes_for :owner, :address, :configuration

    before_validation :set_owner, on: :create

    delegate :supported_locales, :default_locale, :admin_locale, to: :configuration

    after_create -> do
      AccountMailer.welcome_email(self).deliver_later
      AccountMailer.notify_creation_email(self).deliver_later
    end

    private

    def set_owner
      build_owner(
        email: email,
        password: Devise.friendly_token.first(8),
        role: 'admin',
      )
    end
  end
end
