# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'PayrolleeMate/version'

Gem::Specification.new do |spec|
  spec.name          = "PayrolleeMate"
  spec.version       = PayrolleeMate::VERSION
  spec.authors       = ["Ladislav Lisy"]
  spec.email         = ["ladislav.lisy@seznam.cz"]
  spec.description   = %q{
    Simple gem for calculation basic Czech Payroll
  }
  spec.summary       = %q{
     There are included in this gem:
     PayrolleeMate.Common
  }
  spec.homepage      = "https://github.com/ladislavlisy/PayrolleeMateRuby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-expectations"
end
