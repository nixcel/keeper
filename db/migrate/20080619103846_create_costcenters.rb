class CreateCostcenters < ActiveRecord::Migration
  def self.up
    create_table :costcenters do |t|
      t.integer   :account
      t.integer   :sru

      t.timestamps
    end
  end

  def self.down
    drop_table :costcenters
  end
end
