# frozen_string_literal: true

require_relative "lib/crossrefapi/version"

# rubocop:disable Layout/LineLength
Gem::Specification.new do |spec|
  spec.name = "crossrefapi"
  spec.version = Crossrefapi::VERSION
  spec.authors = ["Simon Tarr", "Miguel Torres", "Ian Townsend"]
  spec.email = ["conservation.informatics@iucn.org"]

  spec.summary       = "A Ruby Gem that wraps the CrossRef API for fetching metadata and DOI-related information."
  spec.description   = "This gem provides a simple interface to interact with the CrossRef API. It allows users to search for works, retrieve metadata by DOI, and access citation information, helping to integrate scholarly data into Ruby applications."

  spec.homepage      = "https://github.com/IUCN-UK/crossrefapi"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  File.basename(__FILE__)
  # spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
  #   ls.readlines("\x0", chomp: true).reject do |f|
  #     (f == gemspec) ||
  #       f.start_with?(*%w[bin/ test/ spec/ .git .github appveyor Gemfile])
  #   end
  # end
  spec.files = Dir.glob("lib/**/*", File::FNM_DOTMATCH)

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "faraday"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
# rubocop:enable Layout/LineLength
