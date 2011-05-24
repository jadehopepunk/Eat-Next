require 'lib/food_batch_grouper'

class EatThisWeekDataSource
  def all_rows
    FoodBatchGrouper.build_all_batch_groups
    
    # FoodCategory.all.map do |category|
    #   category.batches_to_eat_this_week
    # end.flatten
    []
  end
end