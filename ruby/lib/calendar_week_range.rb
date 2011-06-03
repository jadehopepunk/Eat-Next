class CalendarWeekRange
  class << self
    def spanning_two_dates(start_date, end_date)
      start_date = DateHelpers.start_of_week(Date.today)
      weeks_count = DateHelpers.calendar_weeks_between(start_date, end_date)
      new(start_date, weeks_count)
    end
  end
  
  attr_reader :length
  
  def initialize(start_date, length)
    @start_date = start_date
    @length = length
  end
end