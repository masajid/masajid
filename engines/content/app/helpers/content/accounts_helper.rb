module Content
  module AccountsHelper
    extend ActiveSupport::Concern

    included do
      helper_method(
        :prefix_link_with_account_domain, :default_account_domain, :protocol
      )
    end

    def prefix_link_with_account_domain(account, link = nil)
      [
        account_domain(account),
        link
      ].join
    end

    def account_domain(account)
      return default_account_domain(account) if account.domain.blank?

      "#{protocol}#{account.domain}"
    end

    def default_account_domain(account)
      "#{protocol}#{account.subdomain}.#{Rails.application.credentials[Rails.env.to_sym][:project_name]}"
    end

    def protocol
      return 'https://' if Rails.configuration.force_ssl

      (defined?(request) && request&.protocol.presence) || 'http://'
    end
  end
end
