# frozen_string_literal: true

require "coupon_code/version"
require "securerandom"

module CouponCode
  SYMBOL = "0123456789ABCDEFGHJKLMNPQRTUVWXY"
  PARTS = 3
  LENGTH = 4

  def self.generate(options = {parts: PARTS, part_length: LENGTH})
    num_parts = options.delete(:parts)
    length_of_parts = options.delete(:part_length) || LENGTH

    parts = []
    (1..num_parts).each do |i|
      data = (1...length_of_parts).map { random_symbol }.join
      parts << data + checkdigit_alg_1(data, i)
    end
    parts.join("-")
  end

  def self.validate(orig, num_parts = PARTS, part_length = LENGTH)
    code = orig.upcase
    code.gsub!(/[^#{SYMBOL}]+/o, "")
    parts = code.scan(/[#{SYMBOL}]{#{part_length}}/)
    return if parts.length != num_parts
    return unless parts.each_with_index.all? { |part, i| part[-1] == checkdigit_alg_1(part[0...-1], i + 1) }
    parts.join("-")
  end

  def self.checkdigit_alg_1(orig, check)
    orig.chars.each_with_index do |c, _|
      k = SYMBOL.index(c)
      check = check * 19 + k
    end
    SYMBOL[check % 31]
  end

  def self.random_symbol
    SYMBOL[SecureRandom.random_number(SYMBOL.length)]
  end
end
