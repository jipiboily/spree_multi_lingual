SpreeMultiLingual
=================
This is a proof of concept for what could become a multi-lingual Spree store plugin.

Warning: code quality is from so-so to poor. Just wanted to put out something before Spreeconf so we could discuss and maybe hack around it.

Notes
-----

Set SpreeMultiLingual.languages to an array containing the languages you support. You might want to set that in config/initializers/spree_multi_lingual.rb or something like that.

	SpreeMultiLingual.languages = ["fr", "en", "es"]
  
There is no fallback of default language for now!

It uses Globalize3. Some code inspired from [https://github.com/tomash/spree_globalize](https://github.com/tomash/spree_globalize) (even took some pieces of code! Especially the "globalize_accessors" method. Why reinvent the wheel when you don't have to?)


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
