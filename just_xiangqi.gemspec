require_relative 'lib/just_xiangqi/version'

Gem::Specification.new do |spec|
  spec.name          = "just_xiangqi"
  spec.version       = JustXiangqi::VERSION
  spec.authors       = ["Mark Humphreys"]
  spec.email         = ["mark@mrlhumphreys.com"]

  spec.summary       = %q{A Xiangqi engine written in ruby}
  spec.description   = %q{Provides a representation of a xiangqi game complete with rules enforcement and serialisation.}
  spec.homepage      = "https://github.com/mrlhumphreys/just_xiangqi"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rake", "~> 13.0.1"
  spec.add_development_dependency "minitest", "~> 5.14.0"

  spec.add_runtime_dependency "board_game_grid", "~> 0.1.9"
end
