class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name
      t.string :description
	  t.string :test
	  t.references :user
	  
      t.timestamps
    end
	Group.new(:name => 'Groupe de David').save
  end

  def self.down
    drop_table :groups
  end
end
