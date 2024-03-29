# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "nesta-plugin-simplicity/version"

Gem::Specification.new do |s|
  s.name        = "nesta-plugin-simplicity"
  s.version     = Nesta::Plugin::Simplicity::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nathanael Jones"]
  s.email       = ["nathanael.jones@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Lifts many unexpected restrictions in Nesta}
  s.description = %q{Adds support for all Sinatra-supported formats, allows css in 'views', etc.}

  s.rubyforge_project = "nesta-plugin-simplicity"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency("nesta", ">= 0.9.11")
  s.add_development_dependency("rake")
end
