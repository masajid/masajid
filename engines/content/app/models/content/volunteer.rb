module Content
  class Volunteer < ApplicationRecord
    extend Content::ScopedTo

    EXPERIENCE_AREA_OPTIONS = %w[cultural social educational religious]
    LANGUAGE_OPTIONS = %w[arabic spanish catalan english french german]

    belongs_to :account, optional: true

    validates :name, presence: true
    validates :identification, presence: true
    validates :birthday, presence: true
    validates :address, presence: true
    validates :phone, presence: true
    validates :email, presence: true
    validates :education, presence: true
    validates :availability, presence: true
    validates :languages, presence: true
    validates :experience, presence: true
    validates :experience_area, presence: true
    validate :check_experience_area
    validate :check_languages

    private
      def check_experience_area
        errors.add(:experience_area, :blank) if experience_area.reject(&:blank?).empty?
      end

      def check_languages
        errors.add(:languages, :blank) if languages.reject(&:blank?).empty? && other_languages.blank?
      end
  end
end
