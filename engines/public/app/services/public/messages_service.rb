module Public
  class MessagesService
    attr_reader :current_account, :params

    def initialize(current_account, params = {})
      @current_account = current_account
      @params = params
    end

    def create
      Content::Message.transaction do
        @message = Content::Message.new(params)

        if @message.save
          Content::MessageMailer.user_email(@message).deliver_later

          if @message.newsletter? && new_subscriber?
            Content::Subscriber.create!(email: @message.email, account: current_account)
          end
        end

        @message
      end
    end

    private

    def new_subscriber?
      !Content::Subscriber.scoped_to(current_account).exists?(email: @message.email)
    end
  end
end
