module Constraints
  class DomainRequired
    def self.matches?(request)
      request.subdomain.present? && request.subdomain != 'www' ||
        Content::Account.exists?(domain: request.host)
    end
  end
end
