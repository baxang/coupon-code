require_relative "lib/coupon_code/version"

Gem::Specification.new do |spec|
  spec.name = "coupon_code"
  spec.version = CouponCode::VERSION
  spec.authors = ["Sanghyun Park"]
  spec.email = ["sh@baxang.com"]
  spec.summary = "Generate and validate coupon codes."
  spec.description = "A Ruby implementation of Perl's" \
                       " Algorithm::CouponCode CPAN module."
  spec.homepage = "https://github.com/baxang/coupon-code"
  spec.license = "MIT"

  spec.metadata = {
    "homepage_uri" => spec.homepage,
    "source_code_uri" => "#{spec.homepage}/tree/master",
    "changelog_uri" => "#{spec.homepage}/blob/master/CHANGELOG.md",
    "rubygems_mfa_required" => "true"
  }

  spec.files = Dir["lib/**/*.rb", "bin/*", "README*.md", "LICENSE.txt", "CHANGELOG.md"]
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.6.0"
end
