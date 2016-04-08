require 'test_helper'

describe CouponCode do
  def generate(*args)
    CouponCode.generate(*args)
  end

  it 'should be loaded.' do
    CouponCode.must_respond_to(:generate)
  end

  it 'should generate a code' do
    generate.wont_be_empty
  end

  it 'should only contain uppercase letters, digits, and dashes.' do
    generate.must_match(/^[0-9A-Z-]+$/)
  end

  it 'should look like XXXX-XXXX-XXXX.' do
    generate.must_match(/^\w{4}-\w{4}-\w{4}$/)
  end

  it 'should generate different codes.' do
    code1 = generate
    code2 = generate
    code1.wont_equal(code2)
  end

  it 'should generate an arbitrary number of parts.' do
    generate(parts: 2).must_match(/^\w{4}-\w{4}$/)
    generate(parts: 5).must_match(/^\w{4}-\w{4}-\w{4}-\w{4}-\w{4}$/)
  end
end
