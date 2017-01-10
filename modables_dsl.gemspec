# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "modables-dsl"
  spec.version       = '0.1.0'
  spec.authors       = ["Chef CC"]
  spec.email         = ["chefcc@modabl.es"]
  spec.summary       = %q{Modables DSL}
  spec.description   = %q{Modables DSL to generate JSON output.}
  spec.homepage      = "http://modabl.es/"
  spec.license       = "Apache 2.0"

  spec.files         = ['lib/modables_dsl.rb']
  spec.executables   = ['bin/modables_dsl']
  spec.test_files    = ['tests/test_modables_dsl.rb']
  spec.require_paths = ["lib"]
end
