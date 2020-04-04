require_dependency 'admin/application_controller'

module Admin
  class MessagesController < ApplicationController
    before_action :touch_seen_at, only: :show

    def index
      authorize Content::Message

      @messages = policy_scope(Content::Message).order(created_at: :desc)
    end

    private

    def message
      @message ||= authorize policy_scope(Content::Message).find(params[:id])
    end

    def touch_seen_at
      message.touch(:seen_at) unless message.seen_at?
    end
  end
end
