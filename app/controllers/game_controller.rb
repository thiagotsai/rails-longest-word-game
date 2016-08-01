require 'longest_word'
class GameController < ApplicationController
  def game
    @grid = generate_grid(9)
  end

  def score
    @attempt = params[:attempt]
    @grid = params[:grid].split("")
    @start_time = Time.new(params[:start_time])
    @end_time = Time.now
    @result = run_game(@attempt, @grid, @start_time, @end_time)
  end
end
