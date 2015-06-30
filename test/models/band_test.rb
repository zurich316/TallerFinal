#Band tests
require 'test_helper'
#Test cases
class BandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
  	@band_uno_test = bands(:one)
  	@band_dos_test= bands(:two)
  end

  test "non-alphanumeric characters presence" do
  	assert_equal(nil, @band_uno_test.valid_code_number?, 'Invalid code number' )
  end


  test "valid code numer" do
  	assert_equal(nil, @band_dos_test.valid_code_number?, 'Invalid code number' )
  end
end
