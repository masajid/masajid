require_dependency 'landing/application_controller'

module Landing
  class ErrorsController < ApplicationController
    include Content::SharedErrors
  end
end
