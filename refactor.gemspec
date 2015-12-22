# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "refactor/version"

Gem::Specification.new do |s|
  s.name        = "refactor"
  s.version     = Refactor::VERSION
  s.authors     = ["Darren Hicks"]
  s.email       = ["darren.hicks@gmail.com"]
  s.homepage    = "https://github.com/deevis/refactor"
  s.summary     = "Code to help refactorings happen safely"
  s.description = "Code to help refactorings happen safely"

  # s.rubyforge_project = "linkser"

  s.files         = %w(.travis.yml MIT_LICENSE.md README.md refactor.gemspec) + Dir['lib/**/*.rb']
  s.require_paths = ["lib"]

  # Gem dependencies
  #

  # Specs
  s.add_development_dependency('rspec', '>= 2.14.1')
end
