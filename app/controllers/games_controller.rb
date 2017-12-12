class GamesController < ApplicationController
  def index
    @breakoutVersion
  end
  
  def new
    @score = score.new
  end
  
  def create
    @posts_json = Posts.all.to_json
    
 end
end