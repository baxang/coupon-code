# CouponCode

CouponCode gem generates and validates coupon codes.
It is a Ruby implementation of [Algorithm::CouponCode CPAN module](https://github.com/grantm/Algorithm-CouponCode)

## Installation

Add this line to your application's Gemfile:

    gem 'coupon_code'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coupon_code

## Usage

    >> require 'coupon_code'
    >> code = CouponCode::Generator.generate
    => "1K7Q-CTFM-LMTC"
    >> CouponCode::Validator.validate(code)
    => true

## Contributing

1. Fork it ( https://github.com/stripeskr/coupon-code/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
