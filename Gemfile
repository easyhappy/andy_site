#source 'http://ruby.taobao.org'
source 'http://rubygems.org'

# Project requirements
gem 'rake'
gem 'tilt', '~> 1.3.7'
gem 'padrino-core'
gem 'padrino-helpers'

# Component requirements
gem 'bcrypt-ruby', :require => 'bcrypt'
gem 'erubis', '~> 2.7.0'
gem 'activerecord', '~> 3.2', :require => 'active_record'
gem 'mysql2'
gem 'dalli', :require => 'active_support/cache/dalli_store'
gem 'kgio'
gem "second_level_cache", :git => "git://github.com/csdn-dev/second_level_cache.git"
gem 'acts-as-taggable-on', :git => "git://github.com/robbin/acts-as-taggable-on.git"
gem 'github-markdown', :require => 'github/markdown'
gem 'will_paginate', :require => ['will_paginate/active_record', 'will_paginate/view_helpers/sinatra']
gem 'sanitize'
gem 'carrierwave', :require => ['carrierwave', 'carrierwave/orm/activerecord']
gem 'mini_magick'
gem 'rest-client'
gem 'typhoeus',             '0.6.6'
gem 'baidupan'
gem 'backup',               '3.4.0'

#view 模板
gem 'slim',                 '2.0.2'

# Production requirements
gem 'unicorn',              '4.6.3'
group :production do
  #gem 'zbatery' 等unicorn研究明白之后使用 zbatery
  #gem 'rainbows'
end

# Development requirements
group :development do
  gem "pry",                  "0.9.12"
  gem "pry-nav",              "0.2.2"
  gem "pry-stack_explorer",   "0.4.9"
  gem 'pry-padrino'
  gem 'padrino-gen',          '0.11'
  gem 'thin'
end

# Test requirements
group :test do
  gem 'minitest', "~>2.6.0", :require => "minitest/autorun"
  gem 'rack-test', :require => "rack/test"
  gem 'factory_girl'
  gem 'database_cleaner'
end
