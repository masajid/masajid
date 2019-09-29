module Content
  class Subscriber < ApplicationRecord
    extend Content::ScopedTo

    belongs_to :account

    validates :email, uniqueness: { scope: :account_id }, format: { with: Devise.email_regexp }
    validates :account, presence: true
  end
end
