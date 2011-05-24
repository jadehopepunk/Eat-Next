require 'lib/food_batch_grouper'

class EatThisWeekDataSource
  def all_rows
    FoodBatchGrouper.build_all_batch_groups
    FoodBatchGroup.all.map do |batch_group|
      "#{batch_group}: #{batch_group.eat_this_week}"
    end
  end
end