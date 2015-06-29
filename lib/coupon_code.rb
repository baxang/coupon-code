require 'securerandom'
require 'digest/sha1'
require 'coupon_code/version'
require 'coupon_code/generator'
require 'coupon_code/validator'

module CouponCode
  SYMBOL = '0123456789ABCDEFGHJKLMNPQRTUVWXY'
  PARTS  = 3
  LENGTH = 4
end
