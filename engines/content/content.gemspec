$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'content/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'content'
  s.version     = Content::VERSION
  s.authors     = ['Gharbi Mohammed']
  s.email       = ['mgharbik@gmail.com']
  s.homepage    = 'https://masajid.world'
  s.summary     = 'Models, Mailers ... etc'
  s.description = s.summary
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 6.0.0'
  s.add_dependency 'rails-i18n', '~> 6.0.0'
  s.add_dependency 'devise'
  s.add_dependency 'pundit'
  s.add_dependency 'friendly_id'
  s.add_dependency 'sidekiq'
  s.add_dependency 'geocoder'
  s.add_dependency 'simple_form'
  s.add_dependency 'ancestry'
  s.add_dependency 'shrine'
  s.add_dependency 'stringex'
  s.add_dependency 'attribute_normalizer'
  s.add_dependency 'postgres-copy', '~> 1.4.0'
  s.add_dependency 'flipper-active_record', '~> 0.17.1'
end
