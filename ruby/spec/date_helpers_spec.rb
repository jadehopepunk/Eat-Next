require 'spec_helper'

describe DateHelpers do
  describe "computing calendar weeks between" do
    it "should return 1 if start and end are in same calendar week" do
      DateHelpers.calendar_weeks_between(Date.new(2011, 5, 23), Date.new(2011, 5, 26)).should == 1
    end
    
    it "should return 2 if start and end are in two contiguous weeks" do
      DateHelpers.calendar_weeks_between(Date.new(2011, 5, 22), Date.new(2011, 5, 23)).should == 2
    end

    it "should return 7 if start and end are 7 weeks apart" do
      DateHelpers.calendar_weeks_between(Date.new(2011, 5, 22), Date.new(2011, 5, 22) + 7.weeks).should == 7
    end

  end
end
