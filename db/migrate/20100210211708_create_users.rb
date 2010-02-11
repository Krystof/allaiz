class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :nom
      t.string :prenom
      t.string :email
      t.date :date_naissance
      t.datetime :date_inscription
      t.datetime :last_connect
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
