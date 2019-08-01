require_dependency 'admin/application_controller'

module Admin
  class SubscribersController < ApplicationController
    def index
      authorize Content::Subscriber

      @subscribers = policy_scope(Content::Subscriber).order(created_at: :desc)
    end
  end
end
