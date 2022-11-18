$:.push File.expand_path('../lib', __FILE__)
require 'hyperwallet/version'
require 'base64'

Gem::Specification.new do |s|
  s.name          = 'hyperwallet-api'
  s.version       = Hyperwallet::VERSION
  s.authors       = ['Taylor Brooks']
  s.email         = ['dGJyb29rc0BnbWFpbC5jb20='].map { |e| Base64.decode64(e) }
  s.homepage      = 'https://github.com/taylorbrooks/hyperwallet'
  s.summary       = 'A Ruby wrapper for the Hyperwallet API'
  s.description   = 'A Ruby wrapper for the Hyperwallet API'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test)/})

  s.required_ruby_version = '~> 2.7'

  s.require_paths = ['lib']

  s.add_runtime_dependency     'faraday', '~> 2.0'
  s.add_runtime_dependency     'json'

  s.add_development_dependency 'bundler', '~> 2.3'
  s.add_development_dependency 'dotenv'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'rspec', '~> 3.7'
  s.add_development_dependency 'sinatra', '~> 2.0'
  s.add_development_dependency 'webmock', '~> 3.1'
end
