module UserNotesHelper
  def format_friendly_time(date_time)
    now = Time.now
    today = now.beginning_of_day..now.end_of_day
    yesterday = (now - 1.day).beginning_of_day..(now - 1.day).end_of_day
    if today.cover?(date_time)
      format = "Today "
    elsif yesterday.cover?(date_time)
      format = "Yesterday "
    else
      format = Time.now.year - date_time.year > 0 ? "%b %d %Y " : "%b %d "
    end
    date_time.strftime(format += "at %I:%M%p")
  end
end