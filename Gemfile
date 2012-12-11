source 'http://rubygems.org'

group :test do
  gem 'ffaker'
  gem 'debugger'
  if ENV['USE_LOCAL_SPREE']
    gem 'spree_core', :path => '~/code/spree'
  else
    gem 'spree_core', :git => 'git://github.com/spree/spree', :branch => '1-3-stable'
  end
end

gemspec
