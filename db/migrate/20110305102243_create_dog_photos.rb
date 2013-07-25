class CreateDogPhotos < ActiveRecord::Migration
  def self.up
    create_table :dog_photos do |t|
      t.string :dog_photo_file_name
      t.string :dog_photo_content_type
      t.integer :dog_photo_file_size
      t.datetime :dog_photo_updated_at
      t.references :dog
      t.timestamps
    end
  end

  def self.down
    drop_table :dog_photos
  end
end
