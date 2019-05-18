module Content
  class Article < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: [:history, :slugged]

    belongs_to :account

    validates :title, presence: true
    validates :slug, presence: true
    validates :summary, presence: true
    validates :account_id, presence: true
  end
end
