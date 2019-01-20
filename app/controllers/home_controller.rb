class HomeController < ApplicationController
  layout 'landing'

  def index
    @accounts = Content::Account.accepted.includes(address: [:city, :country])
  end
end
