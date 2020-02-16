module Landing
  class AccountsService
    attr_reader :params, :account

    def initialize(params = {})
      @params = params
    end

    def create
      Content::Account.transaction do
        @account = Content::Account.new(params)
        @account.build_configuration

        @account.save &&
          Content::AccountMailer.notify_creation_new_entry(@account).deliver_later

        @account
      end
    end
  end
end
