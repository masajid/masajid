require_dependency 'landing/application_controller'

module Landing
  class HomeController < ApplicationController
    layout 'landing/landing'

    def index
      @accounts = Content::Account.accepted.includes(address: :country)

      return unless @accounts.any?

      @bounds = [
        [
          @accounts.map { |account| account.address.longitude }.min,
          @accounts.map { |account| account.address.latitude }.min
        ],
        [
          @accounts.map { |account| account.address.longitude }.max,
          @accounts.map { |account| account.address.latitude }.max
        ]
      ]
    end
  end
end
