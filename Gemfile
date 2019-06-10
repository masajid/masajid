source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.0.0.rc1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'
gem 'image_processing', '~> 1.2'

gem 'bootsnap', '>= 1.4.2', require: false

gem 'bootstrap', '~> 4.2.1'
gem 'jquery-rails'
gem 'chart-js-rails'
gem 'flipper-ui'

group :production do
  gem 'mailjet'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'content', path: 'engines/content'
gem 'landing', path: 'engines/landing'
gem 'admin', path: 'engines/admin'
gem 'public', path: 'engines/public'
