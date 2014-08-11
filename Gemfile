source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use postgresql as the database for Active Record
gem 'pg'

# gem "haml", "~> 4.0.5"
# gem "haml-rails"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby'

## I ADDED THESE BELOW
gem 'thin'
gem 'jquery-ui-rails'

gem "protected_attributes"

group :development, :test do
  gem 'rspec-rails'
  gem 'binding_of_caller'
  gem 'guard-rspec'
  gem 'debugger'
end

group :test do
  gem 'selenium-webdriver', require: false
  gem 'poltergeist', require: false
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'rspec-mocks'
  gem 'shoulda-matchers'


  gem 'launchy'
end

group :development do
  gem 'better_errors'
end

group :production do
  gem 'rails_12factor'  # heroku deployment needs this
  gem 'sprockets-rails' # automatically compile your assests for you don't have to.
end

