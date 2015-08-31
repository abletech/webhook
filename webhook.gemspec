# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "webhook/version"

Gem::Specification.new do |s|
  s.name        = "webhook"
  s.version     = Webhook::VERSION
  s.authors     = ["Nigel Ramsay"]
  s.email       = ["nigel.ramsay@abletech.co.nz"]
  s.homepage    = "https://github.com/AbleTech/webhook"
  s.summary     = %q{Client library for making webhook calls}
  s.description = %q{Execute webhook callbacks easily}
  s.licenses    = ['MIT']

  s.rubyforge_project = "webhook"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake", '~> 0.9'
  s.add_development_dependency "rspec", '~> 2.9'
  s.add_development_dependency "vcr", '~> 2.0'
  s.add_development_dependency "fakeweb", '~> 1.3'
end
