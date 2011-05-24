require 'spec_helper'
require 'lib/models/food_batch_group'

describe FoodBatchGroup do
  describe "computing eat_this_week" do
    before :each do
      @group = FoodBatchGroup.new
    end
    
    describe "with one batch" do
      before :each do
        @batch = FoodBatch.new(:number_of_packages => 4, :package_size => 500.0, :package_size_units => 'g')
        @group.food_batches << @batch
      end
      
      it "should return entire amount if batch expires this week" do
        @batch.use_by = 3.days.from_now
        @group.eat_this_week.to_s.should == '4 x 500g'
      end

      it "should return nothing if batch expired already" do
        @batch.use_by = 1.day.ago
        @group.eat_this_week.should be_nil
      end
      
      it "should return half the amount if batch expires next week" do
        @batch.use_by = 1.week.from_now
        @group.eat_this_week.to_s.should == '2 x 500g'
      end
      
    end
  end
end
