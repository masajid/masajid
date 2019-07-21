require_dependency 'public/application_controller'

module Public
  class HomeController < ApplicationController
    def index
      @slider = current_account.slider
      @articles = Content::Article.scoped_to(current_account)
    end
  end
end
