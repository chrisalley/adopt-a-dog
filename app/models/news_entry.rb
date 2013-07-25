class NewsEntry < ActiveRecord::Base
  acts_as_url :title, :sync_url => true
  
  def to_param 
    url
  end
  
  validates_presence_of :title, :content
  validates_uniqueness_of :title
end