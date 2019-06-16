module Landing
  class Engine < ::Rails::Engine
    isolate_namespace Landing

    initializer :precompile_landing_assets do |app|
      app.config.assets.precompile += %w[landing/landing.js landing/landing.css landing/*]
    end
  end
end
