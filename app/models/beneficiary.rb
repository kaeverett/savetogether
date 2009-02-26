class Beneficiary < ActiveRecord::Base
  has_one :photo, :as => :photographed
  
  has_many :groups, :through => :group_members
  
  before_validation :format_values
  
  validates_format_of :name_first,
    :with => /^[A-Z a-z 0-9 \-\']*\z/,
    :message => "First name can have only letters, numbers, hyphen, and dash"
  
  validates_format_of :name_middle,
    :with => /^[A-Z a-z 0-9 \-\']*\z/,
    :message => "Middle name can have only letters, numbers, hyphen, and dash"
  
  validates_format_of :name_last,
    :with => /^[A-Z a-z 0-9 \-\']*\z/,
    :message => "Last name can have only letters, numbers, hyphen, and dash"
  
  def to_label
    "#{name_first} #{name_last}"
  end
  
  def self.find_featured_beneficiaries
    find(:all)
  end
    
  private
  def format_values
    
  end
end
