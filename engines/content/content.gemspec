$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'content/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'content'
  s.version     = Content::VERSION
  s.authors     = ['Gharbi Mohammed']
  s.email       = ['mgharbik@gmail.com']
  s.homepage    = 'https://theopenmasjid.herokuapp.com/'
  s.summary     = 'Models, Mailers ... etc'
  s.description = s.summary
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.2.1'
  s.add_dependency 'devise'
  s.add_dependency 'simple_form'
  s.add_dependency 'postgres-copy', '~> 1.4.0'
end
