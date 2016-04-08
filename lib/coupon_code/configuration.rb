module CouponCode
  class << self
    attr_accessor :configuration
  end

  def self.config
    @config ||= Configuration.new
  end

  def self.configure
    yield(config)
  end

  def self.reset
    @config = Configuration.new
  end

  class Configuration

    attr_accessor :separator, :part_length, :num_parts

    def initialize
      @separator = '-'
      @part_length = 4
      @num_parts = 3
    end
  end
end
