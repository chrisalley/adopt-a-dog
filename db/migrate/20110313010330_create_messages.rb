class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :name
      t.string :email_address
      t.string :phone_number
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
