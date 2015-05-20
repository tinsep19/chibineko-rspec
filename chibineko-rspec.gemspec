# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chibineko/rspec/version'

Gem::Specification.new do |spec|
  spec.name          = "chibineko-rspec"
  spec.version       = Chibineko::RSpec::VERSION
  spec.authors       = ["Kousuke TANIGUCHI"]
  spec.email         = ["kousuke.taniguchi@gmail.com"]

  spec.summary       = %q{Integration Chibineko in RSpec.}
  spec.description   = %q{Chibineko result into RSpec}
  spec.homepage      = "https://github.com/tinsep19"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rspec"
  spec.add_development_dependency "rspec-its"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "travis"
  spec.add_development_dependency "travis-lint"
  spec.add_development_dependency "coveralls" , require: false
end
