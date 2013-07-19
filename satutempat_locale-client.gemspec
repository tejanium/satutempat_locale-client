# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'satutempat_locale/client/version'

Gem::Specification.new do |spec|
  spec.name          = 'satutempat_locale-client'
  spec.version       = SatutempatLocale::Client::VERSION
  spec.authors       = ['Teja Sophista V.R.']
  spec.email         = ['tejanium@yahoo.com']
  spec.description   = 'SatuTempat Locale Server'
  spec.summary       = 'SatuTempat Locale Server'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'debugger'
  spec.add_development_dependency 'webmock'

  spec.add_runtime_dependency 'minitar'
  spec.add_runtime_dependency 'rest-client'
end
