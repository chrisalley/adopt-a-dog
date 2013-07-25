class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :url
      t.string :email_address
      t.string :password_digest
      t.string :role, :default => :guest.to_s
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
