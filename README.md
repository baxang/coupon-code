[![Ruby](https://github.com/baxang/coupon-code/actions/workflows/ruby.yml/badge.svg)](https://github.com/baxang/coupon-code/actions/workflows/ruby.yml)
[![Gem Version](https://badge.fury.io/rb/coupon_code.svg)](http://badge.fury.io/rb/coupon_code)

# CouponCode

[README-한국어][README-kr]

[CouponCode gem][rubygems] generates and validates coupon codes that are suitable for e-commerce services and businesses.

It is a Ruby implementation of [Grant][grant]'s [Algorithm::CouponCode][couponcode]. Please read [the original documentation of Algorithm::CouponCode](https://metacpan.org/pod/Algorithm::CouponCode) for more details.

Please be aware that some of the original CPAN module's features are not implemented yet. This gem does not generate codes from plaintext, auto-correct mistyped characters, filter out bad words, or skip codes where swapped characters still pass the check digit, and there is no jQuery plugin.

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
    => "7YQH-1FU7-E1HX-0BG9"
    >> CouponCode.validate("7YQH-1FU7-E1HX-0BG9", parts: 4)
    => "7YQH-1FU7-E1HX-0BG9"

You can also change the length of each part like:

    >> CouponCode.generate(parts: 3, part_length: 5)
    => "GRG65-X0PF4-KP7TJ"
    >> CouponCode.validate("GRG65-X0PF4-KP7TJ", parts: 3, part_length: 5)
    => "GRG65-X0PF4-KP7TJ"

## Testing

Run the specs:

```sh
$ bundle exec rake spec
```

Run the linter ([Standard](https://github.com/standardrb/standard)):

```sh
$ bundle exec standardrb
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
