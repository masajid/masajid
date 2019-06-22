require_dependency 'public/application_controller'

module Public
  class HomeController < ApplicationController
    def index
      @slider = current_account.slider
    end
  end
end
