require_dependency 'admin/application_controller'

module Admin
  class ErrorsController < ApplicationController
    include Content::SharedErrors
  end
end
