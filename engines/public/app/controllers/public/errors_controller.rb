require_dependency 'public/application_controller'

module Public
  class ErrorsController < ApplicationController
    include Content::SharedErrors
  end
end
