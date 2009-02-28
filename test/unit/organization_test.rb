require File.dirname(__FILE__) + '/../test_helper'

class OrganizationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_create_minimum_organization
    org = Organization.create()
    assert !org.valid?

    org = Organization.create(:name => "Test Organization Name")
    assert org.valid?
  end  
end
