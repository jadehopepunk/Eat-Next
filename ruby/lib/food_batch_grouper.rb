
class FoodBatchGrouper
  GROUP_FIELDS = %w(food_category_id name variety_name package_size_units)

  class << self
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

    private
      def build_group_for_batches(batches)
        batches.map(&:food_batch_group).compact.uniq.map(&:destroy)
        group = FoodBatchGroup.create!
        batches.each do |batch|
          batch.food_batch_group = group
          batch.save!
        end
      end
    
      def batches_groupable_with(batch)
        FoodBatch.where(batch.attributes.reject {|key, value| !GROUP_FIELDS.include?(key)}).all
      end
  end
end