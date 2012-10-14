# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capo/version'

Gem::Specification.new do |gem|
  gem.name          = 'capo'
  gem.version       = Capo::VERSION
  gem.authors       = ['Jeroen Jacobs', 'Joren De Groof', 'Steven De Coeyer', 'Hannes Fostie']
  gem.email         = ['mail@capo.io']
  gem.description   = 'Command line utility to fetch and manage recipes'
  gem.summary       = 'Command line utility to fetch and manage recipes'
  gem.homepage      = 'http://capo.io'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'capistrano', '>= 2.6.0'
  gem.add_dependency 'git'
end
