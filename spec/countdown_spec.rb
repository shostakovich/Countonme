require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "Countdown"

describe "Countdown" do
  it "should calculate seconds until expiration" do
    now = Time.now
    end_time = now + 100
    countdown = Countdown.new(end_time)

    countdown.seconds_until_expiration(now).should == 100
  end

  it "should calculate hours until expiration" do
    now = Time.now
    not_yet_1_hour = now + 3599
    exactly_1_hour = now + 3600
    over_1_hour = now + 3601

    countdown = Countdown.new(not_yet_1_hour)
    countdown.hours_until_expiration(now).should == 0

    countdown = Countdown.new(exactly_1_hour)
    countdown.hours_until_expiration(now).should == 1

    countdown = Countdown.new(over_1_hour)
    countdown.hours_until_expiration(now).should == 1
  end

  it "should calculate days until expiration" do
    now = Time.now
    not_yet_1_day = now + 86399
    exactly_1_day = now + 86400
    over_1_day = now + 86401

    countdown = Countdown.new(not_yet_1_day)
    countdown.days_until_expiration(now).should == 0

    countdown = Countdown.new(exactly_1_day)
    countdown.days_until_expiration(now).should == 1

    countdown = Countdown.new(over_1_day)
    countdown.days_until_expiration(now).should == 1
  end

  it "should return days and hours until expiration" do
    now = Time.now
    day_and_1_hour = now + 90000
    countdown = Countdown.new(day_and_1_hour)

    day, hour = countdown.days_and_hours_until_expiration
    day.should == 1
    hour.should == 1
  end

  it "should throw an exeption case the countdown expired" do
    now = Time.now
    day_and_1_hour = now - 90000
    lambda{Countdown.new(day_and_1_hour)}.should raise_error
  end
end