$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'admin/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'admin'
  s.version     = Admin::VERSION
  s.authors     = ['Gharbi Mohammed']
  s.email       = ['mgharbik@gmail.com']
  s.homepage    = 'https://masajid.world'
  s.summary     = 'Admin application'
  s.description = s.summary
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'content'
  s.add_dependency 'haml-rails', '~> 2.0.1' # used by sortable_tree_rails
  s.add_dependency 'jquery-ui-rails', '~> 6.0.1' # used by sortable_tree_rails
  s.add_dependency 'sortable_tree_rails'
  s.add_dependency 'trix-gem'
  s.add_dependency 'bootstrap', '~> 4.3.1'
end
