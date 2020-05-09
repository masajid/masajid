require_dependency 'admin/application_controller'

module Admin
  class TranslationsController < ApplicationController
    def index
      render(resource_name)
    end

    private

    def resource_name
      params[:resource].singularize
    end

    def klass
      @klass ||= "Content::#{params[:resource].classify}".constantize
    end

    def resource
      @resource ||= klass.find(params[:resource_id])
    end
    helper_method :resource

    def wrapper_center?
      true
    end
    helper_method :wrapper_center?
  end
end
