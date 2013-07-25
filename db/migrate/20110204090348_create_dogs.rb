class CreateDogs < ActiveRecord::Migration
  def self.up
    create_table :dogs do |t|
      t.string :name
      t.string :url
      t.string :sex
      t.float :weight
      t.integer :age
      t.string :breed
      t.text :characteristics
      t.string :video_url
      t.boolean :adopted, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :dogs
  end
end