module Content
  class Article < ApplicationRecord
    extend Content::ScopedTo
    extend FriendlyId
    friendly_id :title, use: [:history, :slugged]

    VIEWS_TRACKING_EVENT_NAME = 'Viewed article'

    has_one_attached :photo

    belongs_to :account
    has_one :seo_content, as: :searchable
    has_and_belongs_to_many :pages

    validates :title, presence: true
    validates :slug, presence: true
    validates :summary, presence: true
    validates :account_id, presence: true
    validates :photo, presence: true

    accepts_nested_attributes_for :seo_content

    delegate :meta_title, :meta_description, to: :seo_content, allow_nil: true
  end
end
