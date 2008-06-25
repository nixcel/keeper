class AddNameToCostcenter < ActiveRecord::Migration
  def self.up
    add_column :costcenters, :name, :string
  end

  def self.down
    remove_column :costcenters, :name
  end
end
