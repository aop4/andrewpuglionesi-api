source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 4.0.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 8.1'
# Use sqlite3 as the database for Active Record
gem 'pg', '~> 1.6'
# Use Puma as the app server
gem 'puma', '~> 8.0'

gem 'rails_admin', '~> 3.3'

gem 'devise', '~> 5.0'

gem 'bcrypt', '~> 3.1'

gem 'rack-cors', '~> 3.0', require: 'rack/cors'

gem 'flickraw', '~> 0.9'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.23', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '~> 13.0', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.10'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 4.4'
end

group :test do
  gem 'minitest', '~> 6.0'
  gem 'minitest-mock', '~> 5.27'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', '~> 1.2026.1', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "appengine", "~> 0.7"
gem "sassc-rails", '~> 2.1'
gem 'parallel', '~> 2.0'

gem 'aws-sdk-sesv2', '~> 1.97'
