# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'setlistfm/version'

Gem::Specification.new do |spec|
  spec.name          = 'setlistfm'
  spec.version       = Version.version
  spec.authors       = ['Hondallica']
  spec.email         = ['hondallica@gmail.com']

  spec.summary       = 'setlist.fm API client library'
  spec.homepage      = 'https://github.com/hondallica/ruby-setlistfm'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.5'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 1.0.1'
  spec.add_dependency 'faraday_middleware', '~> 1.0.0'
  spec.add_dependency 'hashie', '~> 4.1.0'

  spec.add_development_dependency 'bundler', '~>2.1.4'
  spec.add_development_dependency 'pry', '~> 0.13.1'
  spec.add_development_dependency 'rake', '~> 13.0.1'
  spec.add_development_dependency 'rspec', '~> 3.9.0'
  spec.add_development_dependency 'rubocop', '~> 0.84.0'
  spec.add_development_dependency 'webmock', '~> 3.8.3'
end
