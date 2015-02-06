# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "fluent-plugin-rename-tag"
  gem.version       = "0.0.1"
  gem.authors       = ["sangwook"]
  gem.email         = ["2sangwook@gmail.com"]
  gem.description   = %q{rename tag}
  gem.summary       = %q{rename tag}
  gem.homepage      = "https://github.com/sangwook/fluent-plugin-rename-tag"
  gem.files         = Dir['lib/**/*.rb'] + %w(fluent-plugin-rename-tag.gemspec README.md)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency 'fluentd'
end
