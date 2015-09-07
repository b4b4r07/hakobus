# -*- encoding: utf-8 -*-
require File.expand_path('../lib/hakobus_notifier/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["b4b4r07"]
  gem.email         = ["b4b4r07@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "hakobus_notifier"
  gem.require_paths = ["lib"]
  gem.version       = HakobusNotifier::VERSION

  gem.add_dependency 'thor'
  gem.add_dependency 'nokogiri'
  gem.add_dependency 'anemone'
  gem.add_dependency 'terminal-notifier'
end
