class HomeController < ApplicationController
  layout 'landing'

  def index
    @accounts = Content::Account.accepted.includes(address: :country)

    if @accounts.any?
      @bounds = [
        [
          @accounts.map { |account| account.address.longitude }.min,
          @accounts.map { |account| account.address.latitude }.min,
        ],
        [
          @accounts.map { |account| account.address.longitude }.max,
          @accounts.map { |account| account.address.latitude }.max,
        ]
      ]
    end
  end
end
