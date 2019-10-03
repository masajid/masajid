module Content
  class ApplicationJob < ActiveJob::Base
    include Concerns::RedisFallback
  end
end
