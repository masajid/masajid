module Landing
  class AccountsService
    attr_reader :params, :account

    def initialize(params = {})
      @params =
        params.tap do |result|
          result[:owner_attributes][:password] = Devise.friendly_token.first(8)
          result[:owner_attributes][:role] = :admin
          result[:configuration_attributes] = {
            admin_locale: I18n.locale,
            default_locale: I18n.locale,
            supported_locales: [I18n.locale]
          }
        end
    end

    def create
      Content::Account.transaction do
        @account = Content::Account.new(params)

        @account.save &&
          Content::AccountMailer.notify_creation_new_entry(@account).deliver_later

        @account
      end
    end
  end
end
