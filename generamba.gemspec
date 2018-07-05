# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'generamba/version'

Gem::Specification.new do |spec|
  spec.name          = 'generamba'
  spec.version       = Generamba::VERSION
  spec.authors       = ['Siarhei Ladzeika']
  spec.email         = 'sergey.ladeiko@gmail.com'

  spec.summary       = 'Advanced code generator for Xcode projects with a nice and flexible template system.'
  spec.description   = 'Fork of original Generamba project by Rambler Digital Solutions'
  spec.homepage      = 'https://github.com/ladeiko/Generamba'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ['generamba']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.3'

  spec.add_runtime_dependency 'thor', '0.20.0'
  spec.add_runtime_dependency 'xcodeproj', '1.5.9'
  spec.add_runtime_dependency 'liquid', '4.0.0'
  spec.add_runtime_dependency 'git', '1.3.0'
  spec.add_runtime_dependency 'cocoapods-core', '1.5.3'
  spec.add_runtime_dependency 'terminal-table', '1.8.0'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'fakefs', '~> 0.13.3'
  spec.add_development_dependency 'activesupport', '~> 5.2'
end
