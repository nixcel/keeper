require 'digest/sha1'

class User < ActiveRecord::Base
  
  validates_presence_of       :email, :password
  validates_uniqueness_of     :email
  
  attr_accessor               :password_confirmation
  validates_confirmation_of   :password
  
  def password
    @password
  end
  
  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end
  
  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end
  
  def after_destroy
    if User.count.zero?
      raise "Can't delete last user."
    end
  end
  
  private
    def create_new_salt
      self.salt = self.object_id.to_s + rand.to_s
    end
    
    def self.encrypted_password(password, salt)
      string_to_hash = password + "wibble" + salt
      Digest::SHA1.hexdigest(string_to_hash)
    end
  
end
