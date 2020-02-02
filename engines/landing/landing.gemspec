$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'landing/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'landing'
  s.version     = Landing::VERSION
  s.authors     = ['Gharbi Mohammed']
  s.email       = ['mgharbik@gmail.com']
  s.homepage    = 'https://masajid.world'
  s.summary     = 'Landing UI'
  s.description = s.summary
  s.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'landing gem pushes.'
  end

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'bootstrap', '~> 4.3.1'
  s.add_dependency 'content'
  s.add_dependency 'flag-icons-rails', '~> 3.1.0'

  s.add_development_dependency 'rubocop-rails', '~> 2.4.0'
end
