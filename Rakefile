require 'rake'
require 'rake/testtask'
require 'rake/packagetask'
require 'rubygems/package_task'
require 'rspec/core/rake_task'
require 'spree/core/testing_support/common_rake'

RSpec::Core::RakeTask.new

task :default => [:spec]

spec = eval(File.read('spree_multi_lingual.gemspec'))

Gem::PackageTask.new(spec) do |p|
  p.gem_spec = spec
end

desc "Release to gemcutter"
task :release => :package do
  require 'rake/gemcutter'
  Rake::Gemcutter::Tasks.new(spec).define
  Rake::Task['gem:push'].invoke
end


desc "Generates a dummy app for testing"
task :test_app do
  ENV['LIB_NAME'] = 'spree_multi_lingual'
  Rake::Task['common:test_app'].invoke
  Rake::Task['test_initializer'].invoke
end

desc 'Generates initializer for dummy app'
task :test_initializer => :test_app do

  path = File.join(File.dirname(__FILE__), "spec/dummy/config/initializers/spree_multi_lingual.rb")
  puts "Creating SpreeMultiLingual initializer file at #{path})}"
  File.open(path, 'w') do |f|
    f.write("SpreeMultiLingual.languages = [:en, :fr, :es]\nRails.application.config.i18n.fallbacks = true")
  end
end
