require 'rubygems'
require 'sinatra'
require 'date'
require './lib/Countdown'

get '/compact' do
  @counter_name = params[:title]

  end_date = params[:end_date]
  end_date = DateTime.parse(end_date)
  end_date = end_date.to_time
  countdown = Countdown.new(end_date)

  @days, @hours = countdown.days_and_hours_until_expiration
  haml :counter
end