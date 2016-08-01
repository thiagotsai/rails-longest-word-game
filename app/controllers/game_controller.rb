require 'longest_word'
class GameController < ApplicationController
  def game
    @grid = generate_grid(9)
    session[:score] ||= 0
  end

  def score
    @attempt = params[:attempt]
    @grid = params[:grid].split("")
    # @start_time = Time.new(params[:start_time])
    @start_time = Time.parse(params[:start_time])
    @end_time = Time.now
    @result = run_game(@attempt, @grid, @start_time, @end_time)
    if session[:score].nil?
      session[:score] = @result[:score][0]
    else
      session[:score] += @result[:score]
    end
  end

  def destroy
    # Remove the user id from the session
    session[:score] = nil
    redirect_to root_url
  end
end
