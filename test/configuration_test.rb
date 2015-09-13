require 'test_helper'

module CouponCode
  describe Configuration do
    it 'separator' do
      config = Configuration.new
      config.separator = '*'
      config.separator.must_equal('*')
    end
  end
end
