$:.unshift File.expand_path("../lib", __FILE__)
require 'modables_dsl/version'

Gem::Specification.new do |spec|
  spec.name          = 'modables_dsl'
  spec.version       = ModablesDSL::VERSION
  spec.authors       = ['Modables']
  spec.email         = ['rubygems@modabl.es']
  spec.summary       = %q{DSL toolkit for Terraform and Packer.}
  spec.description   = %q{This DSL generates JSON output that would be consumed by Terraform and Packer as input.}
  spec.homepage      = 'http://modabl.es'
  spec.license       = 'Apache-2.0'

  spec.files         = Dir['LICENSE', 'lib/**/*']
  spec.executables   = ['modables-dsl']
  spec.require_path  = 'lib'

  spec.metadata = {
    'issue_tracker' => 'https://github.com/modables/dsl/issues'
  }

  spec.required_ruby_version = '>= 2.2.2'

  spec.add_runtime_dependency 'activesupport', '~> 5.0'

  spec.add_development_dependency 'rake', '~> 0'
end
