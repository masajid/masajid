module Public
  class Engine < ::Rails::Engine
    isolate_namespace Public

    initializer :add_theme_assets do |app|
      app.config.assets.paths += Gem.loaded_specs['bootswatch'].load_paths
    end
  end
end
