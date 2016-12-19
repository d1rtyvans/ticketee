source "https://rubygems.org"

gem "rails", "4.2.0"

gem "bootstrap-sass", "~> 3.3"
gem "carrierwave", "~> 0.10.0"
gem "coffee-rails", "~> 4.1.0"
gem "database_cleaner", "~> 1.4"
gem "devise", "~> 3.4.1"
gem "fog"
gem "font-awesome-rails", "~> 4.3"
gem "jbuilder", "~> 2.0"
gem "jquery-rails"
gem "pundit", "~> 0.3.0"
gem "rails_12factor", group: :production
gem "sass-rails", "~> 5.0"
gem "sdoc", "~> 0.4.0", group: :doc
gem "searcher", github: "radar/searcher"
gem "simple_form", "~> 3.1.0"
gem "uglifier", ">= 1.3.0"

# the book wants this, but it's pretty wack. Change it
gem "sqlite3", group: %i(development test)
gem "pg",      group: :production

group :development, :test do
  gem "byebug"
  gem "rspec-rails", "~> 3.5"
  gem "spring"
end

group :development do
  gem "web-console", "~> 2.0"
end

group :test do
  gem "capybara", "~> 2.4"
  gem "email_spec", "~> 1.6.0"
  gem "factory_girl_rails", "~> 4.5"
  gem "selenium-webdriver", "~> 2.45"
end
