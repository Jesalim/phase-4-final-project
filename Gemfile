source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.6"

gem "bcrypt", "~> 3.1.7"

gem "byebug"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"

# Use sqlite3 as the database for Active Record in development and test environments
gem 'sqlite3', '~> 1.4.2', '>= 1.4.2.2'

group :production do
  # Use PostgreSQL as the database for Active Record in production
  gem 'pg', '>= 1.2', '< 2.0'
end



# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

gem 'active_model_serializers'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors"


group :development, :test do

  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

# group :development do
#   gem "sqlite3"
#   # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
#   # gem "spring"
# end



# gem "jwt", "~> 2.5"
