class Countdown
  SECONDS_IN_A_DAY = 86400
  SECONDS_IN_A_HOUR = 3600
  HOURS_IN_A_DAY = 24

  def initialize(end_time)
    if end_time < Time.now
      throw new ArgumentError "end_time must be smaller then current time"
    end
    @ends_at = end_time
  end

  # Returns the seconds until ends_at
  def seconds_until_expiration(now=Time.now)
    ((@ends_at - now).abs).round
  end

  # Returns the remaining days until ends_at
  def days_until_expiration(now=Time.now)
    distance_in_days = seconds_until_expiration(now)/SECONDS_IN_A_DAY
    distance_in_days.floor
  end

  # Returns the remaining hours until ends_at
  def hours_until_expiration(now=Time.now)
    distance_in_hours = seconds_until_expiration(now)/SECONDS_IN_A_HOUR
    distance_in_hours.floor
  end

  # Returns the remaining days/hours until ends_at
  def days_and_hours_until_expiration(now=Time.now)
    result = {}
    distance_in_days = seconds_until_expiration(now)/SECONDS_IN_A_DAY
    days = distance_in_days.floor
    hours = hours_until_expiration - distance_in_days * HOURS_IN_A_DAY
    return days, hours
  end
end