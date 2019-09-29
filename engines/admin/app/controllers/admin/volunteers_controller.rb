require_dependency 'admin/application_controller'

module Admin
  class VolunteersController < ApplicationController
    def index
      authorize Content::Volunteer

      @volunteers = policy_scope(Content::Volunteer)
    end
  end
end
