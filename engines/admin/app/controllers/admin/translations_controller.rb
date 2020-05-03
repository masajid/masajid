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
      @resource ||=
        if slugged_models.include?(klass.class_name)
          klass.friendly.find(params[:resource_id])
        else
          klass.find(params[:resource_id])
        end
    end
    helper_method :resource

    def slugged_models
      %w[Content::Article]
    end

    def wrapper_center?
      true
    end
    helper_method :wrapper_center?
  end
end
