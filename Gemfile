source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.1'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.0'
gem 'redis', '~> 3.0'
gem 'auto_increment', '~> 1.5'
gem 'elasticsearch-model', '~> 6.0.0'
gem 'elasticsearch-rails', '~> 6.0.0'
gem 'has_scope', '~> 0.7.2'
gem 'sidekiq',  '~> 5.2.2'
gem 'dalli', '~> 2.7.8'
gem 'memcachier', '~> 0.0.2'
group :development, :test do
  gem 'rspec-rails', '~> 3.5'
  gem 'byebug', platform: :mri
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'faker'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
