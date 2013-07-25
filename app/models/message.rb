class Message < ActiveRecord::Base
  validates_presence_of :name, :email_address, :content
  validates_length_of :content, :maximum => 1000
end
