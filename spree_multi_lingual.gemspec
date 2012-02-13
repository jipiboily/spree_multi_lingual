# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_multi_lingual'
  s.version     = '1.0.0.alpha1'
  s.summary     = 'TODO: Add gem summary here'
  s.description = 'TODO: Add (optional) gem description here'
  s.required_ruby_version = '>= 1.8.7'

  # s.author            = 'You'
  # s.email             = 'you@example.com'
  # s.homepage          = 'http://www.spreecommerce.com'

  #s.files         = `git ls-files`.split("\n")
  #s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.0.0'
  s.add_dependency 'i18n'
  s.add_dependency 'globalize3', '~> 0.2.0.beta8'

  s.add_development_dependency 'capybara', '1.0.1'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.7'
#  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'mysql2'

  # Seems Spree doesn't require it correctly or there is a problem with extensions maybe? Still, it is needed to work with the dummy app!
  s.add_dependency 'sass'
end
