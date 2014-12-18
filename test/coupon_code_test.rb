require 'test_helper'

describe CouponCode do
  it "should generate a code" do
    CouponCode.generate.wont_be_empty
  end

  it "should validate a code it generated" do
    code = CouponCode.generate
    CouponCode.validate(code).must_equal(true)
  end
end