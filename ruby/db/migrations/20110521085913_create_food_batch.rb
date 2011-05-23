class CreateFoodBatch < ActiveRecord::Migration
  def self.up
    create_table :food_batches do |t|
      t.string :name, :variety_name
      t.integer :food_category_id
      t.integer :number_of_packages
      t.decimal :package_size
      t.string :package_size_units, :lenght => 10
      t.date :made_on
      t.date :use_by
      t.boolean :use_in_one_go, :default => false
      t.integer :consume_within_opening_days
      t.timestamps
    end
  end
           
  def self.down
    drop_table :food_batches
  end
end
