source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'devise', '~> 4.1.1'
gem 'foundation-rails'
gem 'carrierwave'
gem 'mini_magick'
gem 'select2-rails', '~> 3.5.2'
gem 'nested_form_fields'
gem 'simple_form'
gem 'cancancan'
gem 'bootstrap-sass'
gem 'jquery-turbolinks'
gem 'wkhtmltopdf-binary'
gem 'wicked_pdf'
gem 'redis'
gem 'sidekiq'
gem 'money-rails'
gem 'bootstrap-datepicker-rails'
gem 'select2_simple_form', github: 'lndl/select2_simple_form', tag: '0.7.3'
gem 'jquery-datatables-rails', '~> 3.4.0'

# Datetime Input
gem 'rome-rails'

gem 'kaminari'
gem 'nested_form'
gem 'has_scope'
gem 'paranoia'

# Admin theme + dependencies
gem 'pure-admin-rails', github: 'blaknite/pure-admin-rails', branch: 'master'
gem 'pure-css-reset-rails', github: 'blaknite/pure-css-reset-rails', branch: 'master'
gem 'exo2-rails', github: 'blaknite/exo2-rails', branch: 'master'
gem 'crummy', github: 'blaknite/crummy', branch: 'master'
gem 'font-awesome-rails'
gem 'pure-css-rails'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
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
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
end

group :test do
  gem 'shoulda', '~> 3.5'
  gem 'shoulda-matchers', '~> 2.0'
  gem 'database_cleaner'
  gem 'faker'
  gem 'pdf-reader'
  gem 'rails-controller-testing'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
