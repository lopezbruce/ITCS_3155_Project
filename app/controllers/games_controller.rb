class GamesController < ApplicationController
  def index
  end
  
  def new
    @score = score.new
  end
end