require 'test_helper'

describe CouponCode do
  describe 'Generator' do
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

  describe 'Validator' do
    it 'should be loaded.' do
      CouponCode.must_respond_to(:validate)
    end

    it 'should fail to validate invalid code.' do
      CouponCode.validate('').must_equal(nil)
    end

    it 'should accept a valid code.' do
      CouponCode.validate('1K7Q-CTFM-LMTC').wont_be_nil
    end

    it 'should reject a short code.' do
      CouponCode.validate('1K7Q-CTFM').must_be_nil
    end

    it 'should accept a short code with correct parts.' do
      CouponCode.validate('1K7Q-CTFM', parts: 2).wont_be_nil
    end

    it 'should reject a short code with wrong parts.' do
      CouponCode.validate('CTFM-1K7Q', parts: 2).must_be_nil
    end

    it 'should fix and validate a lowercase code.' do
      code = '1k7q-ctfm-lmtc'
      CouponCode.validate(code.downcase).must_equal(code.upcase)
    end

    it 'should validate alternative separators.' do
      code = '1k7q/ctfm/lmtc'
      CouponCode.validate(code).must_equal('1K7Q-CTFM-LMTC')

      code = '1k7q ctfm lmtc'
      CouponCode.validate(code).must_equal('1K7Q-CTFM-LMTC')

      code = '1k7qctfmlmtc'
      CouponCode.validate(code).must_equal('1K7Q-CTFM-LMTC')
    end

    it 'should valid code-pretest.' do
      CouponCode.validate('1K7Q', parts: 1).wont_be_nil
      CouponCode.validate('1K7C', parts: 1).must_be_nil

      CouponCode.validate('1K7Q-CTFM', parts: 2).wont_be_nil
      CouponCode.validate('1K7Q-CTFW', parts: 2).must_be_nil

      CouponCode.validate('1K7Q-CTFM-LMTC', parts: 3).wont_be_nil
      CouponCode.validate('1K7Q-CTFM-LMT1', parts: 3).must_be_nil

      CouponCode.validate('7YQH-1FU7-E1HX-0BG9', parts: 4).wont_be_nil
      CouponCode.validate('7YQH-1FU7-E1HX-0BGP', parts: 4).must_be_nil

      CouponCode.validate('YENH-UPJK-PTE0-20U6-QYME', parts: 5).wont_be_nil
      CouponCode.validate('YENH-UPJK-PTE0-20U6-QYMT', parts: 5).must_be_nil

      CouponCode.validate('YENH-UPJK-PTE0-20U6-QYME-RBK1', parts: 6).wont_be_nil
      CouponCode.validate('YENH-UPJK-PTE0-20U6-QYME-RBK2', parts: 6).must_be_nil
    end

    it "should allow a default part length to be set" do
      CouponCode.default_parts(5)

      code = CouponCode.generate
      code.split("-").length.must_equal 5
      CouponCode.validate(code).must_equal code

      CouponCode.default_parts(3) # Set it back for the rest of the tests
    end
  end
end
