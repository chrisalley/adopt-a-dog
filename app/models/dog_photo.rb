class DogPhoto < ActiveRecord::Base
  belongs_to :dog
  
  validates_attachment_presence :dog_photo
  validates_attachment_size :dog_photo, :less_than => 5.megabytes
  validates_attachment_content_type :dog_photo, :content_type => ['image/jpeg']
  
  has_attached_file :dog_photo, :styles => { :thumbnail => "265x200#", :regular => "430x350#" }, 
    :path => ":rails_root/public/system/:attachment/:id/:style/:dog_photo_filename",
    :url => "/system/:attachment/:id/:style/:dog_photo_filename"
  
  before_post_process :dog_photo_filename
  
  # Sets dog photo filename in the database.
  def dog_photo_filename
    if self.dog_photo_content_type == 'image/jpeg'
      self.dog_photo_file_name = "photo.jpg"
    end
  end
  
  # Sets dog photo filename in the file system.
  Paperclip.interpolates :dog_photo_filename do |attachment, style|
    attachment.instance.dog_photo_filename
  end
  
end
