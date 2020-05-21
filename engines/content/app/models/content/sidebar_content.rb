module Content
  class SidebarContent < ApplicationRecord
    include RailsSortable::Model
    set_sortable :position

    translates :title, :body, fallbacks_for_empty_translations: true

    belongs_to :account

    accepts_nested_attributes_for :translations

    validates :body, presence: true
    validates :account, presence: true

    default_scope -> { order(:position) }
  end
end
