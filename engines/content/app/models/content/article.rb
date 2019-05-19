module Content
  class Article < ApplicationRecord
    extend Content::ScopedTo
    extend FriendlyId
    friendly_id :title, use: [:history, :slugged]

    belongs_to :account
    has_and_belongs_to_many :pages

    validates :title, presence: true
    validates :slug, presence: true
    validates :summary, presence: true
    validates :account_id, presence: true
  end
end
