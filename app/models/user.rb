class User < ActiveRecord::Base
  acts_as_url :name, :sync_url => true
  
  def to_param 
    url 
  end
  
  attr_accessible :name, :email_address, :password, :password_confirmation, :role
  
  has_secure_password  
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :name, :email_address
  validates_uniqueness_of :name, :email_address
  
  ROLES = %w[administrator guest]

  # Returns true if user belongs to the specified role.
  def role?(role)
    if self.role == role.to_s
      return true
    else
      return false
    end
  end
  
  def self.authenticate(name_or_email_address, password)
    user = find_by_name(name_or_email_address) || user = find_by_email_address(name_or_email_address)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end