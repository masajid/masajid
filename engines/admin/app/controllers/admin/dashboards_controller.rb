require_dependency 'admin/application_controller'

module Admin
  class DashboardsController < ApplicationController
    def index
      authorize %i[content dashboard], :index?

      @visits = policy_scope(Ahoy::Visit)
    end
  end
end
