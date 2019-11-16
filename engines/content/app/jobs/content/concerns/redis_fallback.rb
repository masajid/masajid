module Content
  module Concerns
    module RedisFallback
      extend ActiveSupport::Concern

      included do
        around_enqueue do |job, block|
          begin
            block.call
          rescue Redis::CannotConnectError, Redis::TimeoutError => exception
            puts "Redis error: #{exception}"

            job.perform_now
          end
        end
      end
    end
  end
end
