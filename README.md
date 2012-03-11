# SpreeMultiLingual

This is a proof of concept for what could become a multi-lingual Spree plugin.

Warning: code quality is so-so (could even be poor). Just wanted to put out something before Spreeconf so we could discuss and maybe hack around it.

## Requirements
 - Spree 1.0.X
 - Rails 3.1.X


## Installation
Add gem to your Gemfile:

	gem "spree_multi_lingual", :git => "git@github.com:jipiboily/spree_multi_lingual.git"

Run Bundler
	bundle install

Add an initializer file and set SpreeMultiLingual.languages to an array containing the languages you support.

	# config/initializers/spree_multi_lingual.rb
	SpreeMultiLingual.languages = ["fr", "en", "es"] # Add your own locales here

Copy migrations
	bundle exec rake spree_multi_lingual:install:migrations

Run migrations
	bundle exec rake db:migrate

Add Javascript to your "app/assets/admin/all.js"

	//= require admin/spree_multi_lingual

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

For now, only products name, description, meta description and meta keywords are translated.

# WARNING
there is no fallback of default language for now!

## Notes

It uses Globalize3, easy_globalize3_accessors and routing-filter. Thanks to [Tomash](https://github.com/tomash) that told me about those two awesome gems: easy_globalize3_accessors and routing-filter.


## TODO

1. Add tests
	- Capybara (selenium driver)
2. Travis-CI
3. Add things to translate:
	- Taxons
	- Taxonomies
	- Option types
	- Option values
	- Properties
	- Alt text on images
4. Dropdown or something to change locale
5. Fallback
6. Rake task for store that already have users

## Testing (not used as of now: shame)

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test app
    $ bundle exec rspec spec

Copyright (c) 2012 Jean-Philippe Boily, released under the New BSD License