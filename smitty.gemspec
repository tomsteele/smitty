# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smitty/version'

Gem::Specification.new do |spec|
  spec.name          = "smitty"
  spec.version       = Smitty::VERSION
  spec.authors       = ["Tom Steele"]
  spec.email         = ["thomasjsteele@gmail.com"]
  spec.description   = %q{Send mail with handlebars like templates}
  spec.summary       = %q{Send mail with handlebars like templates}
  spec.homepage      = "https://github.com/tomsteele/smitty"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "docopt", ">= 0.5.0"
  spec.add_dependency "nokogiri", ">= 1.6.0"
  spec.add_dependency "mail", ">= 2.5.4"
  spec.add_dependency "premailer", ">= 1.7.3"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
