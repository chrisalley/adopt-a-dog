class Page < ActiveRecord::Base
  acts_as_url :title, :sync_url => true
  
  def to_param 
    url
  end

  validates_presence_of :title, :content
  validates_uniqueness_of :title  
  
  validates_attachment_size :form, :less_than => 5.megabytes
  validates_attachment_content_type :form, :content_type => ['application/pdf']
  
  has_attached_file :form,
    :path => ":rails_root/public/system/:attachment/:id/:style/:form_filename",
    :url => "/system/:attachment/:id/:style/:form_filename"
  
  before_post_process :form_filename
  
  # Sets form filename in the database.
  def form_filename
    if self.form_content_type == 'application/pdf'
      self.form_file_name = "form.pdf"
    end
  end
  
  # Sets form filename in the file system.
  Paperclip.interpolates :form_filename do |attachment, style|
    attachment.instance.form_filename
  end
end