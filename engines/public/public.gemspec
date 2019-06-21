$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'public/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'public'
  spec.version     = Public::VERSION
  spec.authors     = ['Gharbi Mohammed']
  spec.email       = ['mgharbik@gmail.com']
  spec.homepage    = 'https://theopenmasjid.herokuapp.com/'
  spec.summary     = 'Public application'
  spec.description = spec.summary
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'content'
  spec.add_dependency 'detectify'
  spec.add_dependency 'font-awesome-rails'
  spec.add_dependency 'bootswatch'
end
