module Content
  module AccountsHelper
    extend ActiveSupport::Concern

    included do
      helper_method *%i[
        prefix_link_with_account_domain
        default_account_domain
        protocol
      ]
    end

    def prefix_link_with_account_domain(account, link = nil)
      [
        account_domain(account),
        link
      ].join
    end

    def account_domain(account)
      # FIXME: uncomment when domain is added to account
      # return account.domain if account.domain.present?

      default_account_domain(account)
    end

    def default_account_domain(account)
      "#{protocol}#{account.subdomain}.#{ENV['PROJECT_HOSTNAME']}"
    end

    def protocol
      return 'https://' if Rails.configuration.force_ssl

      (defined?(request) && request&.protocol.presence) || 'http://'
    end
  end
end
