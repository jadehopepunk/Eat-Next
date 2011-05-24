class FoodBatchGrouper
  class << self
    GROUP_FIELDS = %w(food_category_id name variety_name package_size_units)
    
    def build_all_batch_groups
      result = ActiveRecord::Base.connection.select_values "SELECT id FROM food_batches GROUP BY #{GROUP_FIELDS.join(', ')}"
      result.each do |batch_id|
        batch = FoodBatch.find(batch_id)
        build_group_for_batch(batch)
      end
    end

    def build_group_for_batch(batch)
      build_group_for_batches(batches_groupable_with(batch))
    end
    
    def build_group_for_batches(batches)
      puts "Group #{batches.map(&:id).inspect}"
    end
    
    def batches_groupable_with(batch)
      FoodBatch.where(batch.attributes.reject {|key, value| !GROUP_FIELDS.include?(key)})
    end
  end
end