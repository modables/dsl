# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'modables_dsl'
  spec.version       = '0.1.0'
  spec.authors       = ['Chef CC']
  spec.email         = ['chefcc@modabl.es']
  spec.summary       = %q{Modables DSL}
  spec.description   = %q{Modables DSL to generate JSON output.}
  spec.homepage      = 'http://modabl.es'
  spec.license       = 'Apache-2.0'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0'

  spec.add_runtime_dependency 'activesupport', ['>= 5.0']

  spec.add_development_dependency 'rake'
end
