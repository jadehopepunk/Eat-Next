class CreateFoodBatchGroups < ActiveRecord::Migration
  def self.up
    create_table :food_batch_groups do |t|
    end
  end

  def self.down
    drop_table :food_batch_groups
  end
end
