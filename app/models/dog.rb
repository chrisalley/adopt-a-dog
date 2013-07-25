class Dog < ActiveRecord::Base
  acts_as_url :name, :sync_url => true
  
  def to_param 
    "#{id}-#{url}"
  end

  has_many :dog_photos
  accepts_nested_attributes_for :dog_photos, :reject_if => lambda { |a| a[:dog_photo].blank? },
    :allow_destroy => true
  
  validates_presence_of :name, :sex, :weight, :age, :breed, :characteristics
  validates_length_of :name, :in => 2..50
  validates_length_of :characteristics, :in => 2..300 
  validates_numericality_of :weight
  validates_numericality_of :age, :only_integer => true
  
  SEXES = %w[female male other]
  
end