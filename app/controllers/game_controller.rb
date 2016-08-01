require 'longest_word'
class GameController < ApplicationController
  def game
    @grid = generate_grid(9)
    session[:score] ||= 0
  end

  def score
    @attempt = params[:attempt]
    @grid = params[:grid].split("")
    @start_time = Time.parse(params[:start_time])
    @end_time = Time.now
    @result = run_game(@attempt, @grid, @start_time, @end_time)

    session[:score] += @result[:score]
  end

  def destroy
    # Remove the user id from the session
    session[:score] = nil
    redirect_to root_url
  end
end
