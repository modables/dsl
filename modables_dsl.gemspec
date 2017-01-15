$:.unshift File.expand_path("../lib", __FILE__)

Gem::Specification.new do |spec|
  spec.name          = 'modables_dsl'
  spec.version       = '0.1.0'
  spec.authors       = ['Chef CC']
  spec.email         = ['chefcc@modabl.es']
  spec.summary       = %q{A DSL toolkit for Terraform and Packer.}
  spec.description   = %q{This DSL generates JSON output that would be consumed by Terraform and Packer as input.}
  spec.homepage      = 'http://modabl.es'
  spec.license       = 'Apache-2.0'

  spec.files         = ['LICENSE', 'lib/**/*']
  spec.executables   = ['bin/modables-dsl']
  spec.require_path  = 'lib'

  spec.required_ruby_version = '~> 2.2'

  spec.add_runtime_dependency 'activesupport', '~> 5.0'

  spec.add_development_dependency 'rake'
end
