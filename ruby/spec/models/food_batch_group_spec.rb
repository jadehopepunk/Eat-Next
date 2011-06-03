require 'spec_helper'
require 'lib/models/food_batch_group'

describe FoodBatchGroup do
  def results_for_weeks(week_count)
    (1..week_count).map do |week|
      result = nil
      Timecop.freeze(Date.today + 7 * week) { result = @group.eat_this_week }
      result
    end
  end
  
  describe "computing eat_this_week" do
    before :each do
      @group = FoodBatchGroup.new
      @monday = DateHelpers.start_of_week(Date.today)
      @today = @monday + 1
      Timecop.freeze(@today)
    end
    
    describe "with one batch" do
      before :each do
        @batch = FoodBatch.new(:number_of_packages => 2, :package_size => 500.0, :package_size_units => 'g')
        @group.food_batches << @batch
      end
      
      it "should return entire amount if batch expires this week" do
        @batch.use_by = @today + 3
        @group.eat_this_week.to_s.should == '2 x 500g'
      end

      it "should return nothing if batch expired already" do
        @batch.use_by = @today - 1
        @group.eat_this_week.should be_nil
      end
      
      it "should return half the amount if batch expires next week" do
        @batch.use_by = @today + 7
        @group.eat_this_week.to_s.should == '500g'
      end
      
      describe "when package need not be used in one go" do
        it "can break up package to spread evenly across weeks" do
          @batch.use_by = @today + 7 * 3
          @group.eat_this_week.to_s.should == '250g'
        end
      end
      
      describe "when package must be used in one go" do
        before :each do
          @batch.use_in_one_go = true
        end
        
        it "use one package in the middle of each set of weeks" do
          @batch.use_by = @today + 7 * 5
          results_for_weeks(6).should == [nil, '500g', nil, nil, '500g', nil]
        end
      end
    end
  end
end
