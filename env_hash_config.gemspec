# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'env_hash_config/version'

Gem::Specification.new do |spec|
  spec.authors = ['Dave Willkomm']
  spec.email = ['dinosaurjr10@gmail.com']
  spec.files = Dir['lib/**/*.rb']
  spec.homepage = 'https://github.com/dinosaurjr10/env_hash_config'
  spec.license = 'MIT'
  spec.name = 'env_hash_config'
  spec.required_ruby_version = '>= 2.0.0'
  spec.summary = %q{Creates a configuration object from ENV.}
  spec.version = EnvHashConfig::VERSION

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'coveralls', '~> 0.8'
  spec.add_development_dependency 'dotenv', '~> 2.1'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
