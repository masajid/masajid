module Content
  module Concerns
    module RedisFallback
      extend ActiveSupport::Concern

      included do
        around_enqueue do |job, block|
          begin
            block.call
          rescue Redis::CannotConnectError, Redis::TimeoutError => exception
            Core::ExceptionHandler.capture(exception.to_s)
            job.perform_now
          end
        end
      end
    end
  end
end
