require 'test_helper'

describe 'Configuration' do
  it 'separator' do
    config = CouponCode::Configuration.new
    config.separator = '*'
    config.separator.must_equal('*')
  end
end
