module CouponCode
  def self.validate(orig, num_parts = PARTS)
    code = orig.upcase
    code.gsub!(/[^0-9A-Z]+/, '')
    parts = code.scan(/[0-9A-Z]{#{LENGTH}}/)
    return if parts.length != num_parts
    parts.each_with_index do |part, i|
      data  = part[0...(LENGTH - 1)]
      check = part[-1]
      return if check != checkdigit_alg_1(data, i + 1)
    end
    parts.join('-')
  end

  def self.checkdigit_alg_1(orig, check)
    orig.split('').each_with_index do |c, _|
      k = SYMBOL.index(c)
      check = check * 19 + k
    end
    SYMBOL[check % 31]
  end
  private_class_method :checkdigit_alg_1
end
