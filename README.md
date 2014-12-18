[![Build Status](https://travis-ci.org/baxang/coupon-code.svg)](https://travis-ci.org/baxang/coupon-code)
[![Code Climate](https://codeclimate.com/github/baxang/coupon-code/badges/gpa.svg)](https://codeclimate.com/github/baxang/coupon-code)

# CouponCode

CouponCode gem generates and validates coupon codes.

It is a Ruby implementation of [Grant][grant]'s [Algorithm::CouponCode][couponcode],
but please note that only basic generation/validation functionality  implemented at the moment and
some of the features the CPAN module provides such as feeding a plaintext, auto-correct, and jQuery plugin are
not yet implemented.

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
[license]: https://raw.github.com/appsattic/node-coupon-code/master/LICENSE