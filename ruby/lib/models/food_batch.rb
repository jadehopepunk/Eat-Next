class FoodBatch < ActiveRecord::Base
  belongs_to :food_category
  belongs_to :food_batch_group
  
  scope :unexpired, lambda {
    where("use_by <= ?", Date.today)
  }
  
  def category_name=(value)
    self.food_category = value.blank? ? nil : FoodCategory.find_or_create_by_name(value)
  end
  
  def category_name
    food_category.name if food_category
  end
  
  def to_s
    [category_name, '-', name, variety_name].reject(&:blank?).join(' ')
  end
end

# create_table "food_batch", :force => true do |t|
#   t.string   "name"
#   t.string   "variety_name"
#   t.integer  "food_category_id"
#   t.integer  "number_of_packages"
#   t.decimal  "package_size"
#   t.string   "package_size_units"
#   t.date     "made_on"
#   t.date     "use_by"
#   t.boolean  "use_in_one_go",               :default => false
#   t.integer  "consume_within_opening_days"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end