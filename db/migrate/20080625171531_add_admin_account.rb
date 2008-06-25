class AddAdminAccount < ActiveRecord::Migration
  def self.up
    User.delete_all
    User.create(:email => 'test@example.com', :password => 'admin', :password_confirmation => 'admin')
  end

  def self.down
    User.delete_all
  end
end
