class CreateAdhesions < ActiveRecord::Migration
  def self.up
    create_table :adhesions do |t|
		t.references :user
		t.references :group

		t.timestamps
    end
  end

  def self.down
    drop_table :adhesions
  end
end
