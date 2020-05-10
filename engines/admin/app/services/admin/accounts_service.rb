module Admin
  class AccountsService
    attr_reader :account, :params

    def initialize(account, params = {})
      @account = account
      @params = params
    end

    def update
      return false unless account.update(params)

      if uploaded_logo.present?
        configuration.logo.attach(uploaded_logo)
      elsif configuration.remove_logo
        configuration.logo.purge_later
      end

      true
    end

    private

    def configuration
      @configuration ||= account.configuration
    end

    def uploaded_logo
      @uploaded_logo ||= params.dig(:account, :configuration_attributes, :logo)
    end
  end
end
