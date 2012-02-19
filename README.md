SpreeMultiLingual
=================
This is a proof of concept for what could become a multi-lingual Spree plugin.

Warning: code quality is so-so (could even be poor). Just wanted to put out something before Spreeconf so we could discuss and maybe hack around it.

Notes
-----

Set SpreeMultiLingual.languages to an array containing the languages you support. You might want to set that in config/initializers/spree_multi_lingual.rb or something like that.

	SpreeMultiLingual.languages = ["fr", "en", "es"]
  
Warning: there is no fallback of default language for now!

It uses Globalize3, easy_globalize3_accessors and routing-filter. Thanks to [Tomash](https://github.com/tomash) that told me about those two awesome gems: easy_globalize3_accessors and routing-filter.


Example
=======

Example goes here.

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test app
    $ bundle exec rspec spec

Copyright (c) 2012 Jean-Philippe Boily, released under the New BSD License