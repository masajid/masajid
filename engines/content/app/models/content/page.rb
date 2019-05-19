module Content
  class Page < ApplicationRecord
    extend Content::ScopedTo
    has_ancestry

    normalize_attribute  :ancestry, with: :blank

    belongs_to :account
    has_and_belongs_to_many :articles

    validates :name, presence: true
    validates :permalink, presence: true
    validates :account_id, presence: true

    before_validation :set_permalink
    after_update :update_children_permalinks, if: :saved_change_to_permalink?

    def pretty_name
      [ancestors.map(&:name), name].flatten.join(' -> ')
    end

    def permalink_part
      permalink.split('/').last
    end

    def permalink_part=(value)
      self.permalink =
        if parent.present?
          "#{parent.permalink}/#{value}"
        else
          value
        end
    end

    def set_permalink
      self.permalink_part = permalink.present? ? permalink_part : name.to_url
    end

    def update_children_permalinks
      children.each(&:update_permalink)
    end

    def update_permalink
      set_permalink
      save!
    end
  end
end
