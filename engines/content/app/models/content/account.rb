module Content
  class Account < ApplicationRecord
    belongs_to :owner, class_name: 'Content::User'
    has_one :address, as: :addressable

    enum status: %i[pending accepted declined]

    validates :subdomain, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :mosque, presence: true
    validates :responsable, presence: true
    validates :owner, presence: true
    validates :address, presence: true

    accepts_nested_attributes_for :owner, :address

    before_validation :set_owner, on: :create

    after_create -> do
      AccountMailer.welcome_email(self).deliver_now
      AccountMailer.notify_creation_email(self).deliver_now
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
