class GamesController < ApplicationController
  def index
  end
  
  def new
    @score = score.new
  end
  
  def create
    @posts_json = Posts.all.to_json
    
 end
end