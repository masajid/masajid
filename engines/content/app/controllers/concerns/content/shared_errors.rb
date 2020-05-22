module Content
  module SharedErrors
    extend ActiveSupport::Concern

    def not_found
      render template: 'content/errors/not_found', status: 404
    end

    def unacceptable
      render template: 'content/errors/unacceptable', status: 422
    end

    def internal_error
      render template: 'content/errors/internal_error', status: 500
    end
  end
end
