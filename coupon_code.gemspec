# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coupon_code/version'

Gem::Specification.new do |spec|
  spec.name          = 'coupon_code'
  spec.version       = CouponCode::VERSION
  spec.authors       = ['Sanghyun Park']
  spec.email         = ['sh@baxang.com']
  spec.summary       = 'Generate and validate coupon codes.'
  spec.description   = 'A Ruby implementation of Perl\'s' \
                       ' Algorithm::CouponCode CPAN module.'
  spec.homepage      = 'https://github.com/baxang/coupon-code'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.4'
end
