module Content
  class Message < ApplicationRecord
    extend Content::ScopedTo

    belongs_to :account

    validates :name, presence: true
    validates :phone, presence: true
    validates :email, email: true
    validates :subject, presence: true
    validates :body, presence: true
    validates :account, presence: true

    scope :not_seeing, -> { where(seen_at:  nil) }

    def readonly?
      persisted?
    end
  end
end
