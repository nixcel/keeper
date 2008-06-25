class AddTestData < ActiveRecord::Migration
  def self.up
    Verification.delete_all
    Verification.create(:date => '2008-05-16', :description => 'Köp av dator')
    Verification.create(:date => '2008-05-23', :description => 'Faktura #1 skickad')
    Verification.create(:date => '2008-06-12', :description => 'Eget uttag')
  end

  def self.down
    Verification.delete_all
  end
end
