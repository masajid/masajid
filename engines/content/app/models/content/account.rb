module Content
  class Account < ApplicationRecord
    belongs_to :owner, class_name: 'Content::User', foreign_key: :content_owner_id
    belongs_to :address, foreign_key: :content_address_id

    validates :subdomain, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :mosque, presence: true
    validates :responsable, presence: true
    validates :owner, presence: true
    validates :address, presence: true

    accepts_nested_attributes_for :owner, :address

    before_validation :set_owner

    private

    def set_owner
      build_owner(
        email: email,
        password: Devise.friendly_token.first(8)
      )
    end
  end
end
