class FoodCategory < ActiveRecord::Base
  has_many :food_batches
  
  def batches_to_eat_this_week
    food_batches.unexpired
  end
end