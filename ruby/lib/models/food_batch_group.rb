class FoodBatchGroup < ActiveRecord::Base
  has_many :food_batches
  
  def to_s
    batch = food_batches.first
    values = FoodBatchGrouper::GROUP_FIELDS.map {|key| batch[key]}
    values.join(' - ')
  end
  
  def eat_this_week
    if food_batches.length == 1
      batch = food_batches.first
      if batch.expired?
      else
        weeks_to_eat = DateHelpers.calendar_weeks_between(Date.today, batch.use_by)
        batch.amount / weeks_to_eat
      end
    end
  end
end