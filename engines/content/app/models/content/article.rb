module Content
  class Article < ApplicationRecord
    extend Content::ScopedTo
    extend FriendlyId
    friendly_id :title, use: [:history, :slugged]

    VIEWS_TRACKING_EVENT_NAME = 'Viewed article'.freeze
    VIDEO_SOURCE_OPTIONS = %w[youtube vimeo].freeze

    has_one_attached :photo

    belongs_to :account
    has_one :seo_content, as: :searchable
    has_and_belongs_to_many :pages

    validates :title, presence: true
    validates :slug, presence: true
    validates :account_id, presence: true
    validates :video_source, inclusion: { in: VIDEO_SOURCE_OPTIONS }, allow_blank: true
    validates :video_id, presence: true, if: :video_source?

    accepts_nested_attributes_for :seo_content

    delegate :meta_title, :meta_description, to: :seo_content, allow_nil: true

    default_scope { order(published_at: :desc) }
  end
end
