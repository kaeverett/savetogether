require File.dirname(__FILE__) + '/../test_helper'

class BeneficiaryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_create_beneficiary
    Beneficiary.create(
      :name_first => "Samantha",
      :name_last => "Smith",
      :statement => "Samantha is saving to open her own framing business.",
      :photo => Photo.create(
        :uploaded_data => fixture_file_upload("../files/WACASH_saver1.jpg", 'image/jpg')
      )
    )
  end
end
