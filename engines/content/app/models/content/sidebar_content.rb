module Content
  class SidebarContent < ApplicationRecord
    belongs_to :account

    validates :body, presence: true
    validates :account, presence: true
  end
end
