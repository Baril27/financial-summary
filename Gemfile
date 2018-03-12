source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'

gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'money-rails', '~> 1.9'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'sqlite3'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'factory_bot', '~> 4.8'
  gem 'ffaker', '~> 2.7'
  gem 'pry-rails', '~> 0.3  '
  gem 'rspec-rails', '~> 3.6'
  gem 'selenium-webdriver'
  gem 'timecop', '~> 0.9'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rspec_junit_formatter'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
