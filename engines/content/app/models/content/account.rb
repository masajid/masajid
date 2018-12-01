module Content
  class Account < ApplicationRecord
    belongs_to :owner, class_name: 'Content::User'
    belongs_to :address

    validates :subdomain, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :mosque, presence: true
    validates :responsable, presence: true
    validates :user, presence: true
    validates :address, presence: true
  end
end
