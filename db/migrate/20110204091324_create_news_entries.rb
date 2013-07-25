class CreateNewsEntries < ActiveRecord::Migration
  def self.up
    create_table :news_entries do |t|
      t.string :title
      t.string :url
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :news_entries
  end
end