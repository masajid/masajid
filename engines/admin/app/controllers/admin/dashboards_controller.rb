require_dependency 'admin/application_controller'

module Admin
  class DashboardsController < ApplicationController
    def index
      authorize [:content, :dashboard], :index?
    end
  end
end
