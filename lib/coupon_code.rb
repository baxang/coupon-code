require "coupon_code/version"
require "securerandom"
require "digest/sha1"

module CouponCode
  SYMBOL = "0123456789ABCDEFGHJKLMNPQRTUVWXY"
  PARTS = 3
  LENGTH = 4

  def self.generate(options = { parts: PARTS, part_length: LENGTH })
    num_parts = options.delete(:parts)
    length_of_parts = options.delete(:part_length) || LENGTH

    parts = []
    (1..num_parts).each do |i|
      part = ''
      (1...length_of_parts).each { part << random_symbol }
      part << checkdigit_alg_1(part, i)
      parts << part
    end
    parts.join("-")
  end

  def self.validate(orig, num_parts = PARTS, part_length = LENGTH)
    code = orig.upcase
    code.gsub!(/[^#{SYMBOL}]+/, '')
    parts = code.scan(/[#{SYMBOL}]{#{part_length}}/)
    return if parts.length != num_parts
    parts.each_with_index do |part, i|
      data  = part[0...(part_length - 1)]
      check = part[-1]
      break if check != checkdigit_alg_1(data, i + 1)
    end
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
    SYMBOL[rand(SYMBOL.length)]
  end
end
