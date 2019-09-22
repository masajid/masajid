require_dependency 'public/application_controller'

module Public
  class SubscribersController < ApplicationController
    respond_to :js

    def create
      @subscriber = Content::Subscriber.new(subscriber_params)
    end

    private
      def subscriber_params
        params.require(:subscriber).permit(:email).merge(account: current_account)
      end
  end
end
