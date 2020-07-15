
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
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  # spec.bindir        = "exe"
  spec.executables   = ["coffee_hunt_cli"]
  spec.require_paths = ["lib"]
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) } 
  spec.add_development_dependency "bundler", "~> 2.0" 
  # spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "http"
  spec.add_development_dependency "rake", ">= 12.3.3"
  # spec.add_development_dependency "httparty"
end 


#Our gems rely on other gems and we put those here 
#We run "bundle install after adding" 
#We have added http gem in this example 

#gemspec 
  #What other gems depend on. 
  #Specifies what other gems get installed when you install this gem. 

#gemfile 
  #specific dependencies for a project. 
  #Determines what happens when you run bundle install 


  #git init   new repo 
  #bundle gem  "name"   #creates gem and builds a local git repository 

  #git add .  (loads all the changes into the current directory into the staging area) 
  #git add (specify file) (also an option)
  
  #git commit (all the changes in the staging area are committed to the repo)

  #git push (add the commits you have locally to the repo)

  #git commit -am  adds everything and commits it in the current directory  
