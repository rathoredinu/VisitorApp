class CreateVisitors < ActiveRecord::Migration
  def self.up
		create_table :visitors do |t|
				t.string :name
				t.integer :age
				t.string :address
				t.string :contact
				t.string :gender
				t.string :contactperson
				t.time :intime
				t.time :outtime
				t.date :date
			t.timestamps
		end
		end
		def self.down
				drop_table :visitors
		end
end
