require_dependency 'landing/application_controller'

module Landing
  class HomeController < ApplicationController
    include Content::AccountsHelper

    layout 'landing/landing'

    def index
      @accounts = Content::Account.accepted.includes(address: :country)
    end
  end
end
