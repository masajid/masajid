$:.push File.expand_path('lib', __dir__)

require '../content/lib/content/version'
require '../content/lib/content/specifications'

Gem::Specification.new do |s|
  s.name        = 'admin'
  s.version     = Content::VERSION
  s.authors     = Content::Specifications::AUTHORS
  s.email       = Content::Specifications::EMAIL
  s.homepage    = Content::Specifications::HOMEPAGE
  s.summary     = 'Admin application'
  s.description = s.summary
  s.license     = Content::Specifications::LICENCE
  s.files       = Content::Specifications::FILES

  s.add_dependency 'batch_translations' # adds globalize_fields_for form builder
  s.add_dependency 'bootstrap', '~> 4.3.1'
  s.add_dependency 'chartkick', '~> 3.3.0'
  s.add_dependency 'content'
  s.add_dependency 'groupdate'
  s.add_dependency 'haml-rails', '~> 2.0.1' # used by sortable_tree_rails
  s.add_dependency 'jquery-ui-rails', '~> 6.0.1' # used by sortable_tree_rails
  s.add_dependency 'sortable_tree_rails'
  s.add_dependency 'trix-rails'
end
