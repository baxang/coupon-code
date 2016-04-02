require 'coupon_code/version'
require 'securerandom'
require 'digest/sha1'

module CouponCode
  SYMBOL  = "0123456789ABCDEFGHJKLMNPQRTUVWXY"
  LENGTH  = 4
  @@parts = 3

  def self.generate(options = { parts: @@parts })
    (1..options[:parts]).map do |i|
      part = ""
      (1...LENGTH).each { part << random_symbol }
      part << checkdigit_alg_1(part, i)

      part
    end.join("-")
  end

  def self.validate(orig, options = { parts: @@parts })
    num_parts = options.delete(:parts)
    code      = orig.upcase.gsub(/[^0-9A-Z]+/, "")
    parts     = code.scan(/[0-9A-Z]{#{LENGTH}}/)

    return if parts.length != num_parts

    parts.each_with_index do |part, i|
      data  = part[0...(LENGTH - 1)]
      check = part[-1]

      return if check != checkdigit_alg_1(data, i + 1)
    end

    parts.join("-")
  end

  def self.default_parts(parts)
    @@parts = parts
  end

  private

  def self.checkdigit_alg_1(orig, check)
    orig.split('').each_with_index do |c, _|
      k = SYMBOL.index(c)
      check = check * 19 + k
    end
    SYMBOL[check % 31]
  end

  def self.random_symbol
    SYMBOL[rand(SYMBOL.length)]
  end
end
