source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.6'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'rspec-rails', '~> 3.7'
  gem "factory_bot_rails", "~> 4.0"
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
  gem 'database_cleaner'
  # help your app run on background, make test faster
  gem 'spring-commands-rspec'
  # lets you express expected outcomes on collections of an object in an example.
  gem 'rspec-collection_matchers'

  gem 'cucumber-rails', :require => false

  gem 'capybara'
end

# Authentication
gem 'devise'

# Upload image
gem 'carrierwave', '~> 1.0'
# create image version
gem 'mini_magick', '~> 4.5', '>= 4.5.1'

# style
gem 'bootstrap-sass', '~> 3.3.7'

gem 'sprockets-rails', :require => 'sprockets/railtie'

# simple form
gem 'simple_form', '> 3.1.0'

# full-text-search
gem 'pg_search'

gem 'byebug', platform: :mri

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
