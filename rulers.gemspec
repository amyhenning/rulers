require_relative 'lib/rulers/version'

Gem::Specification.new do |spec|
  spec.name          = "rulers"
  spec.version       = Rulers::VERSION
  spec.authors       = ["amyhenning"]
  spec.email         = ["henning.amy@gmail.com"]

  spec.summary       = %q{A rack-based web framework}
  spec.description   = %q{A rack-based web framework, created while rebuilding Rails}
  spec.homepage      = "https://github.com/amyhenning/rulers"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/amyhenning/rulers"
  spec.metadata["changelog_uri"] = "https://github.com/amyhenning/rulers/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rack", "~> 2.2"
  spec.add_runtime_dependency "erubis"
  spec.add_development_dependency "rack-test", "~> 2.0"
  spec.add_development_dependency "rspec", "3.11"
end
