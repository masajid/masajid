module Content
  class SidebarContent < ApplicationRecord
    include RailsSortable::Model
    set_sortable :position

    belongs_to :account

    validates :body, presence: true
    validates :account, presence: true

    default_scope -> { order(:position) }
  end
end
