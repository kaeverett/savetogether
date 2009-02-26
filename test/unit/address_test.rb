require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  fixtures :organizations
  
  def test_valid_address
    address = Address.create(:line1 => "123 Test Street", :city => "Test City", :state => "WA", :zip => "98117")
    assert !address.valid?
  end

  def test_address_missing_belongs_to
    address = Address.create(:line1 => "123 Test Street", :city => "Test City", :state => "WA", :zip => "98117")
    assert !address.valid?
    errors = address.errors()
    assert errors.count > 0
    assert_not_nil errors['addressable']
  end
end
