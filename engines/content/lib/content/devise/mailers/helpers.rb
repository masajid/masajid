module Devise
  module Mailers
    module Helpers
      def devise_mail(record, action, opts = {}, &block)
        initialize_from_record(record)
        make_bootstrap_mail headers_for(action, opts), &block
      end
    end
  end
end
