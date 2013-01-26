# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blogaze/version'

Gem::Specification.new do |gem|
  gem.name          = "blogaze"
  gem.version       = Blogaze::VERSION
  gem.authors       = ["Jack Polgar"]
  gem.email         = ["nrx@nirix.net"]
  gem.summary       = 'Blogaze is a simple blog.'
  gem.description   = 'Blogaze is a simple blog powered by Ramaze and Sequel.'
  gem.homepage      = "http://blogaze.org"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'ramaze', ['~> 2012.12.08']
  gem.add_dependency 'sequel', ['~> 3.43.0']
  gem.add_dependency 'maruku', ['~> 0.6.1']
  gem.add_dependency 'time-lord', ['~> 0.2.5']
  gem.add_dependency 'shebang', ['~> 0.1']
  gem.add_dependency 'bcrypt-ruby', ['~> 3.0.1']
end
