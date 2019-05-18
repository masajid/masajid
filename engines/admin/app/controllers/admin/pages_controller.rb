require_dependency 'admin/application_controller'

module Admin
  class PagesController < ApplicationController
    protect_from_forgery with: :null_session, only: :sort

    include SortableTreeController::Sort
    sortable_tree 'Content::Page', { parent_method: 'parent', sorting_attribute: 'position' }

    def index
      @pages = policy_scope(Content::Page).arrange(order: :position)
    end
  end
end
