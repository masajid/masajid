module Content
  class Newsletter < ApplicationRecord
    extend Content::ScopedTo

    has_one_attached :photo
    belongs_to :account
    has_and_belongs_to_many :articles

    validates :subject, presence: true
    validates :body, presence: true, if: -> { articles.size.zero? }
    validates :date, timeliness: { on_or_after: :today, type: :date }, allow_blank: true

    validates :account, presence: true

    def readonly?
      sent_at.present?
    end
  end
end
