$:.push File.expand_path('lib', __dir__)

require '../content/lib/content/version'
require '../content/lib/content/specifications'

Gem::Specification.new do |s|
  s.name        = 'landing'
  s.version     = Content::VERSION
  s.authors     = Content::Specifications::AUTHORS
  s.email       = Content::Specifications::EMAIL
  s.homepage    = Content::Specifications::HOMEPAGE
  s.summary     = 'Landing UI'
  s.description = s.summary
  s.license     = Content::Specifications::LICENCE
  s.files       = Content::Specifications::FILES

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'landing gem pushes.'
  end

  s.add_dependency 'bootstrap', '~> 4.3.1'
  s.add_dependency 'content'
  s.add_dependency 'flag-icons-rails', '~> 3.1.0'
  s.add_dependency 'jquery-rails', '~> 4.4.0'
end
