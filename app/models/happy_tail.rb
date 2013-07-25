class HappyTail < ActiveRecord::Base
  acts_as_url :name, :sync_url => true
  
  def to_param 
    "#{id}-#{url}"
  end
  
  validates_presence_of :name, :content
  
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg']
  
  has_attached_file :photo, :styles => { :regular => "145x145#" }, 
    :path => ":rails_root/public/system/:attachment/:id/:style/:photo_filename",
    :url => "/system/:attachment/:id/:style/:photo_filename"
  
  before_post_process :photo_filename
  
  # Sets photo filename in the database.
  def photo_filename
    if self.photo_content_type == 'image/jpeg'
      self.photo_file_name = "photo.jpg"
    end
  end
  
  # Sets photo filename in the file system.
  Paperclip.interpolates :photo_filename do |attachment, style|
    attachment.instance.photo_filename
  end
end