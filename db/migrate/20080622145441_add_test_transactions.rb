class AddTestTransactions < ActiveRecord::Migration
  def self.up
    Transaction.delete_all
    Transaction.create(:verification_id => 6, :debit => 1000, :credit => 0, :costcenter_account => 1250)
    Transaction.create(:verification_id => 6, :debit => 0, :credit => 1000, :costcenter_account => 1940)
  end

  def self.down
    Transaction.delete_all
  end
end
