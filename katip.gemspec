# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'katip/version'

Gem::Specification.new do |spec|
  spec.name          = 'katip'
  spec.version       = Katip::VERSION
  spec.authors       = %w[lab2023]
  spec.email         = %w[info@lab2023.com]
  spec.description   = %q{This is a Change Logging gem for a git initialized project.}
  spec.summary       = %q{Planned to design a rake which dumps the change log as a list grouped by version tags. Log rows will contain links to commits, commit note and contributer name.}
  spec.homepage      = 'https://github.com/kebab-project/katip'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = %w[katip]
  spec.require_paths = %w[lib]

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'

  spec.extra_rdoc_files = %w[README.md CHANGELOG.md]
end
