require_dependency 'public/application_controller'

module Public
  class HomeController < ApplicationController
    def index
      @slider = current_account.slider
      @articles = Content::Article.scoped_to(current_account).paginate(page: params[:page], per_page: 10)
    end
  end
end
