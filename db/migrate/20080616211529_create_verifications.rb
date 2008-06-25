class CreateVerifications < ActiveRecord::Migration
  def self.up
    create_table :verifications do |t|
      t.date :date
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :verifications
  end
end
