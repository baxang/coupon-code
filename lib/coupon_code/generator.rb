module CouponCode
  def self.generate(options = { parts: PARTS })
    num_parts = options.delete(:parts)
    parts = []
    (1..num_parts).each do |i|
      part = ''
      (1...LENGTH).each { part << random_symbol }
      part << checkdigit_alg_1(part, i)
      parts << part
    end
    parts.join('-')
  end

  def self.random_symbol
    SYMBOL[rand(SYMBOL.length)]
  end
  private_class_method :random_symbol
end
