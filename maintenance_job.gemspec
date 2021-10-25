require_relative "lib/maintenance_job/version"

Gem::Specification.new do |spec|
  spec.name        = "maintenance_job"
  spec.version     = MaintenanceJob::VERSION
  spec.authors     = ["Ayush Newatia"]
  spec.email       = ["ayush@hey.com"]
  spec.homepage    = "https://github.com/ayushn21/maintenance_job"
  spec.summary     = "Mechanism to run testable one-off jobs at deploy time to manipulate data"
  spec.license     = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir["{app,db,lib}/**/*", "LICENSE.md", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1"
end
