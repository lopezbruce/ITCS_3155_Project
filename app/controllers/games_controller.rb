class GamesController < ApplicationController
  def index
    @breakoutVersion
  end
  
  def audio_path(source, options = {})
    path_to_asset(source, {type: :audio}.merge!(options))
  end
  
  def new
    @score = score.new
  end
  
  def create
    @posts_json = Posts.all.to_json
    
 end
end