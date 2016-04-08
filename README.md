[![Build Status](https://travis-ci.org/baxang/coupon-code.svg)](https://travis-ci.org/baxang/coupon-code)
[![Code Climate](https://codeclimate.com/github/baxang/coupon-code/badges/gpa.svg)](https://codeclimate.com/github/baxang/coupon-code)
[![Test Coverage](https://codeclimate.com/github/baxang/coupon-code/badges/coverage.svg)](https://codeclimate.com/github/baxang/coupon-code/coverage)
[![Gem Version](https://badge.fury.io/rb/coupon_code.svg)](http://badge.fury.io/rb/coupon_code)

# CouponCode

[README-한국어][README-kr]

[CouponCode gem][rubygems] generates and validates coupon codes that are suitable for e-commerce services and businesses.

It is a Ruby implementation of [Grant][grant]'s [Algorithm::CouponCode][couponcode]. Please read [the original documentation of Algorithm::CouponCode](http://search.cpan.org/dist/Algorithm-CouponCode/lib/Algorithm/CouponCode.pm) for more details.

Please be aware that some of the original CPAN module's features are not implemented yet. For example, generating codes by plaintext, auto correction, and jQuery plugin are missing in this gem.

This gem is developed for https://stripes.co.kr

## Installation

Add this line to your application's Gemfile:

    gem 'coupon_code'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coupon_code

## Synopsis

    >> require 'coupon_code'
    >> code = CouponCode.generate
    => "1K7Q-CTFM-LMTC"
    >> CouponCode.validate(code)
    => "1K7Q-CTFM-LMTC"
    >> CouponCode.validate('1K7Q-CTFM-LMTO') # Invalid code
    => nil

## Options

You can change the number of parts of the generated code by passing an option hash value like:

    >> CouponCode.generate(parts: 4)
    => "1K7Q-CTFM-LMTC-DLGP"
    >> CouponCode.validate("1K7Q-CTFM-LMTC-DLGP", 4)
    => "1K7Q-CTFM-LMTC-DLGP"

## Testing

```ruby
$ bundle exec rake test
```

## Thanks to

 - [Grant McLean][grant]'s [Algorithm::CouponCode][couponcode] in Perl
 - [Andrew Chilton][chilts]'s [NodeJS implementation][node-couponcode] in JavaScript

## License

MIT. See [LICENSE][license] for more details.

## Contributing

1. Fork it ( https://github.com/baxang/coupon-code/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[grant]: https://github.com/grantm/
[couponcode]: https://github.com/grantm/Algorithm-CouponCode
[chilts]: https://github.com/chilts
[node-couponcode]: https://github.com/chilts/node-coupon-code
[license]: https://github.com/baxang/coupon-code/blob/master/LICENSE.txt
[README-kr]: https://github.com/baxang/coupon-code/blob/master/README-ko.md
[rubygems]: https://rubygems.org/gems/coupon_code
