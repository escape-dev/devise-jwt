source "https://rubygems.org"

ruby "3.2.2"

gem "rails", "~> 7.1.4"

gem "pg", "~> 1.1"

gem "puma", ">= 5.0"

gem "redis", ">= 4.0.1"

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "bootsnap", require: false

gem "kaminari"

gem "rack-cors"
gem "rack-attack"

gem "devise"
gem "devise-jwt"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem "pry"

  gem "dotenv-rails"

  gem "rubocop-rails-omakase", require: false
end
