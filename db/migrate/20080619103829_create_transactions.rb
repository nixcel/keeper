class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer   :verification_id, :null => false, :options =>
        "CONSTRAINT fk_transaction_verifications REFERENCES verifications(id)"
      t.decimal   :debit,   :null => false,    :precision => 9, :scale => 2
      t.decimal   :credit,  :null => false,    :precision => 9, :scale => 2
      t.integer   :costcenter_account, :null => false, :options =>
        "CONSTRAINT fk_transaction_costcenters REFERENCES costcenters(account)"
      
      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
