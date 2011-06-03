class FoodBatchGroup < ActiveRecord::Base
  has_many :food_batches
  
  def to_s
    batch = food_batches.first
    values = FoodBatchGrouper::GROUP_FIELDS.map {|key| batch[key]}
    values.join(' - ')
  end
  
  def eat_this_week
    if food_batches.length == 1
      each_batch_this_week(food_batches.first)
    end
  end
  
  private
  
    def each_batch_this_week(batch)
      if batch.expired?
      else
        week_range = CalendarWeekRange.spanning_two_dates(Date.today, batch.use_by)
        spread_across_weeks(batch, week_range)
      end
    end
    
    def spread_across_weeks(batch, week_range)
      if batch.use_in_one_go == false || (batch.number_of_packages % (week_range.length) == 0)
        batch.amount / week_range.length
      else
        spread_packages_across_weeks(batch, week_range)
      end
    end
    
    def spread_packages_across_weeks(batch, week_range)
      puts week_range.length / batch.number_of_packages
    end
    
end