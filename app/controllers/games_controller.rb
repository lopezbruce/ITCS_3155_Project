class GamesController < ApplicationController
  def index
  end
  
  def new
    @score = score.new
  end
  
  def create
    @score = Score.new params['score']
    if @score.save
      render :json => { } # send back any data if necessary
    else
      render :json => { }, :status => 500
    end
  end
end