
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "currency_cli/version"

Gem::Specification.new do |spec|
  spec.name          = "currency_cli"
  spec.version       = CurrencyCli::VERSION
  spec.authors       = ["nguyensach"]
  spec.email         = ["sachnbbkhn@gmail.com"]

  spec.summary       = %q{currency exchange command line interface}
  spec.description   = %q{use https://currencylayer.com/ api}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency "thor"
end
