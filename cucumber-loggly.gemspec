# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cucumber-loggly/version'

Gem::Specification.new do |gem|
  gem.name          = "cucumber-loggly"
  gem.version       = CucumberLoggly::VERSION
  gem.authors       = ["brettweavnet"]
  gem.email         = ["open-source-845@weav.net"]
  gem.description   = %q{Cucumber log searching pluging for Loggly.}
  gem.summary       = %q{cucumber-loggly matches number of expected events in loggly}
  gem.homepage      = "https://github.com/brettweavnet/cucumber-loggly"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"

  gem.add_runtime_dependency "cucumber", "~> 1.2.1"
  gem.add_runtime_dependency "loggly-ruby-client", "~> 0.2.1"
  gem.add_runtime_dependency "trollop", "= 2.0"
  gem.add_runtime_dependency "rspec", "~> 2.11.0"
end
