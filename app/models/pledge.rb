class Pledge < ActiveRecord::Base
  has_many :pledge_line_items
  belongs_to :user
  belongs_to :organization
    
  def amount
    amount = 0
    self.pledge_line_items.each do |dli|
      amount += dli.amount
    end
    
    return amount
  end
end
