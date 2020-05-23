module Landing
  class Engine < ::Rails::Engine
    isolate_namespace Landing

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot
      # TODO: add to content engine
      # g.factory_bot dir: 'spec/factories', suffix: 'factory'
    end
  end
end
