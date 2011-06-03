module DateHelpers
  class << self
    def calendar_weeks_between(start_date, end_date)
      days_between_weeks = start_of_week(end_date) - start_of_week(start_date)
      return 1 if days_between_weeks == 0
      ((days_between_weeks + 1).to_f / 7.0).ceil
    end

    def start_of_week(date)
      date.to_date - day_of_week(date)
    end
      
    private
    
      def day_of_week(date)
        date.wday == 0 ? 7 : date.wday - 1
      end
  end
end