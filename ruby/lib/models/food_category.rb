class FoodCategory < ActiveRecord::Base
  has_many :food_batches
end