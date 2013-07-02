class HomeController < ApplicationController


  def home
  end

  def calculate

    @trains = {
      :l => ["8th-l", "6th-l", "union", "3rd-l", "1st-l"],
      :n => ["8th-n", "union", "23rd-n", "28th-n", "34th-n", "ts"],
      :s => ["ap", "union", "23rd-s", "28th-s", "33rd-s", "gc"],
    }

    @on_station = params[:on_station]
    @on_line = params[:on_line].to_sym
    @off_station = params[:off_station]
    @off_line = params[:off_line].to_sym

  if @on_station == @off_station
     @result = "You don't need to catch the train.... you are already at your destination!"
  elsif @on_line == @off_line
     stops = @trains[@on_line].index(@on_station) - @trains[@on_line].index(@off_station)
     if stops < 0
      stops *= -1
      @result = "Your journey is #{stops} stops!"
    end
  else
    intersection = (@trains[@on_line] & @trains[@off_line]).first.to_s
    to_interesection = (@trains[@on_line].index(@on_station)) - (@trains[@on_line].index(intersection))
    if to_interesection< 0
        to_interesection *= -1
    end
    from_intersection = @trains[@off_line].index(@off_station) - @trains[@off_line].index(intersection)
    if from_intersection < 0
      from_intersection *= -1
    end
    @result = "Your journey is #{to_interesection + from_intersection} stops!"
  end
  render 'home'
  end
end