require_dependency 'public/application_controller'

module Public
  class MessagesController < ApplicationController
    respond_to :js

    def create
      @message = Content::Message.new(message_params)

      if @message.save &&
        # TODO: send email to the mosque

        if @message.newsletter? && !Content::Subscriber.scoped_to(current_account).exists?(email: @message.email)
          Content::Subscriber.create!(email: @message.email, account: current_account)
        end
      end
    end

    private

    def message_params
      params
        .require(:message)
        .permit(:name, :phone, :email, :subject, :body, :newsletter)
        .merge(account: current_account)
    end
  end
end
