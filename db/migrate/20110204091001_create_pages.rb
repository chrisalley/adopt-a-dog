class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.string :url
      t.text :content
      t.string :form_file_name
      t.string :form_content_type
      t.integer :form_file_size
      t.datetime :form_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end