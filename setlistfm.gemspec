
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'setlistfm/version'

Gem::Specification.new do |spec|
  spec.name          = 'setlistfm'
  spec.version       = Setlistfm::VERSION
  spec.authors       = ['Hondallica']
  spec.email         = ['hondallica@gmail.com']

  spec.summary       = 'setlist.fm API client library'
  spec.homepage      = 'https://github.com/hondallica/ruby-setlistfm'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.4'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 0.13.1'
  spec.add_dependency 'faraday_middleware','~> 0.12.2'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '12.1.0'
  spec.add_development_dependency 'rspec', '~> 3.6'
  spec.add_development_dependency 'rubocop', '0.50.0'
  spec.add_development_dependency 'webmock', '3.0.1'
end
