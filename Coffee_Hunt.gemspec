
lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "coffee_hunt" 

require_relative 'lib/coffee_hunt/version'


Gem::Specification.new do |spec|
  spec.name          = "Coffee_Hunt"
  spec.version       = CoffeeHunt::VERSION
  spec.authors       = ["angelastephens"]
  spec.email         = ["angelastephens317@gmail.com"]

  spec.summary       = %q{CLI  Coffee shop gem}
  spec.description   = %q{A CLI that will help you on your hunt for the perfect cup of coffee.}
  spec.homepage      = "https://github.com/angelastephens/Coffee_Hunt"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  
  
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.executables   = ["coffee_hunt_cli"]
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 2.0" 
  spec.add_development_dependency "pry"
  spec.add_dependency "http"
  spec.add_development_dependency "rake", ">= 12.3.3"
end 



