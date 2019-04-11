
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "clio_audio_visualizer/version"

Gem::Specification.new do |spec|
  spec.name          = "clio_audio_visualizer"
  spec.version       = ClioAudioVisualizer::VERSION
  spec.authors       = ["Dennis Taylor"]
  spec.email         = ["dennis.taylor@clio.com"]

  spec.summary       = %q{Audio visualization for Clio site health}
  spec.description   = %q{Now with added goats!}
  spec.homepage      = "https://github.com/fimmtiu/clio_audio_visualizer"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry-byebug"
end
