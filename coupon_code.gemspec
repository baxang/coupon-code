# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coupon_code/version'

Gem::Specification.new do |spec|
  spec.name          = "coupon_code"
  spec.version       = CouponCode::VERSION
  spec.authors       = ["Sanghyun Park"]
  spec.email         = ["sh.park@stripes.co.kr"]
  spec.summary       = %q{Generate and validate coupon codes.}
  spec.description   = %q{A Ruby implementation of Perl's Algorithm::CouponCode CPAN module.}
  spec.homepage      = "https://github.com/stripeskr/coupon-code"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
