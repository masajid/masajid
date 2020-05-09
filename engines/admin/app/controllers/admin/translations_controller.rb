require_dependency 'admin/application_controller'

module Admin
  class TranslationsController < ApplicationController
    RESOURCE_NAME_MAPPING = {
      'sidebar' => 'sidebar_content'
    }

    def index
      render(resource_name)
    end

    private

    def resource_name
      @resource_name ||= RESOURCE_NAME_MAPPING[params[:resource]] || params[:resource].singularize
    end

    def klass
      @klass ||= "Content::#{resource_name.classify}".constantize
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
