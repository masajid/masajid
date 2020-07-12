module Landing
  class Engine < ::Rails::Engine
    isolate_namespace Landing

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot
    end
  end
end
