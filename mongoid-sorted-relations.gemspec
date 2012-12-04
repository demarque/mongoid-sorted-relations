# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "mongoid-sorted-relations"
  s.version     = "0.0.4"
  s.authors     = ["Sebastien Rosa"]
  s.email       = ["sebastien@demarque.com"]
  s.extra_rdoc_files = ["LICENSE", "README.md"]
  s.licenses    = ["MIT"]
  s.homepage    = "https://github.com/demarque/mongoid-sorted-relations"
  s.summary     = "Preserve the order of the mongoid documents in a referenced one-to-many or many-to-many relationship."
  s.description = "Preserve the order of the mongoid documents in a referenced one-to-many or many-to-many relationship."

  s.rubyforge_project = "mongoid-sorted-relations"

  s.files         = Dir.glob('{lib,spec}/**/*') + %w(LICENSE README.md Rakefile Gemfile)
  s.require_paths = ["lib"]

  s.add_development_dependency('mongoid', ['>= 3.0.9'])
  s.add_development_dependency('rake', ['>= 0.8.7'])
  s.add_development_dependency('rspec', ['>= 2.0'])
  s.add_development_dependency('rspec-aspic', ['>= 0.0.2'])
end
