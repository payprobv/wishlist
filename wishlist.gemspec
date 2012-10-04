# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wishlist/version'

Gem::Specification.new do |gem|
  gem.name          = "wishlist"
  gem.version       = Wishlist::VERSION
  gem.authors       = ["Ivan Malijkh"]
  gem.email         = ["ivan@lesslines.com"]
  gem.description   = %q{Wishlist API Wrapper}
  gem.summary       = %q{Wishlist API Wrapper}
  gem.homepage      = "http://lesslines.com"
  
  gem.add_dependency 'mechanize', '2.5.1'
  gem.add_dependency 'yajl-ruby', '1.1.0'
  gem.add_dependency 'active_support', '~> 3.0.0'
  
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-bundler'
  gem.add_development_dependency 'guard-minitest'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'turn'
  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rb-fsevent', '~> 0.9.1'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
