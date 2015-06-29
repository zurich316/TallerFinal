require 'test_helper'

class BandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
  	@band1 = bands(:one)
  	@band2= bands(:two)
  end

  test "non-alphanumeric characters presence" do
  	assert_equal(nil, @band1.valid_code_number?, 'Invalid code number' )
  end


  test "valid code numer" do
  	assert_equal(nil, @band2.valid_code_number?, 'Invalid code number' )
  end
end
