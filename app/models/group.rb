class Group < ActiveRecord::Base
  belongs_to :organization
  has_many :group_members
  has_many :beneficiaries, :through => :group_members
end
