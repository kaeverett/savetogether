class GroupMember < ActiveRecord::Base
  belongs_to :beneficiary
  belongs_to :group
end
