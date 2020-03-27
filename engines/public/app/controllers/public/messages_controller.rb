require_dependency 'public/application_controller'

module Public
  class MessagesController < ApplicationController
    respond_to :js

    def create
      @message = Public::MessagesService.new(current_account, message_params).create

      !@message.persisted? &&
        @errors = @message.errors.full_messages.join(', ')
    rescue StandardError
      @errors = t('public.messages.create.error')
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
