# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "webhook/version"

Gem::Specification.new do |s|
  s.name        = "webhook"
  s.version     = Webhook::VERSION
  s.authors     = ["Nigel Ramsay"]
  s.email       = ["nigel.ramsay@abletech.co.nz"]
  s.homepage    = ""
  s.summary     = %q{Execute webhook callbacks easily}
  s.description = %q{Execute webhook callbacks easily}

  s.rubyforge_project = "webhook"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "vcr"
  s.add_development_dependency "fakeweb"
end
