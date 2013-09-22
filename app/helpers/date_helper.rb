module DateHelper

	 # Given a date, get, say, last tuesday
  def current_or_last_day_of_week(day_of_week, time = DateTime.now)
		if time.wday == day_of_week
			time.beginning_of_day
		else
			time_iter = time
			while time_iter.wday != day_of_week do
				time_iter = time_iter - 1.day
			end
			time_iter.beginning_of_day
		end
	end
end