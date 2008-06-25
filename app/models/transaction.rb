class Transaction < ActiveRecord::Base
  belongs_to  :verification
  belongs_to  :costcenter
  
  validates_presence_of :costcenter_account, :debit, :credit
end
