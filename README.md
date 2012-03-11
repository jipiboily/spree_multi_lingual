# SpreeMultiLingual

SpreeMultiLingual is originally a proof of concept for what could become a multi-lingual Spree plugin.

Since then integration tests and features have been added.

## Requirements
 - Spree 1.0.X
 - Rails 3.1.X


## Installation
Add gem to your Gemfile:

```ruby
gem "spree_multi_lingual", :git => "git@github.com:sbounmy/spree_multi_lingual.git"
gem 'routing-filter', :git => "git://github.com/MoritzMoritz/routing-filter.git", :branch => "locale-exclusion"
```

Run Bundler

```ruby
bundle install
```

Add an initializer file and set SpreeMultiLingual.languages to an array containing the languages you support.

```ruby
# config/initializers/spree_multi_lingual.rb
SpreeMultiLingual.languages = ["fr", "en", "es"] # Add your own locales here
```

For the moment, enable locale fallbacks for I18n (makes lookups for any locale fall back to the I18n.default_locale when a translation can not be found)

```ruby
# config/application.rb
config.I18.fallbacks = true
```

Run spree_multi_lingual install:

```ruby
rails g spree_multi_lingual:install
```

If you want to use browser language detection using rack-contrib Locale :

```ruby
# config.ru
require 'rack'
require 'rack/contrib'

use Rack::Locale

require ::File.expand_path('../config/environment',  __FILE__)
run MyRailsApp::Application
```

## Use
On views where there is translated fields, there should be a dropdown to switch currently edited locale. 

### What is translated?

For now :
- products : name, permalink, description, meta description and meta keywords.
- taxonomies : name.
- taxons : name, permalink and description.

# WARNING
there is no fallback of default language for now unless you speficy I18n.fallbacks as previously stated.

## Notes

It uses Globalize3, easy_globalize3_accessors and routing-filter. Thanks to [Tomash](https://github.com/tomash) that told me about those two awesome gems: easy_globalize3_accessors and routing-filter.

SpreeMultiLingual depends on a fork of routing-filter because it supports :exclude option in routes, used for /admin. I hope it this feature can me merged into the original repo.

## TODO

1. Make taxons multi languages editable from the taxonomy tree
2. Dynamically show taxon full permalink depending on dropdown language selected : Taxons#edit
2. Travis-CI
3. Admin default locale ?
4. Add things to translate:
	- Option types
	- Option values
	- Properties
	- Alt text on images
5. Dropdown or something to change locale
6. Fallback
7. Rake task for store that already have users

## Testing

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test app
    $ bundle exec rspec spec

Copyright (c) 2012 Jean-Philippe Boily, released under the New BSD License