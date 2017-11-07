class StatsController < ApplicationController
    def new
        @stat = Stat.new
    end
    
    def create
        @stat = Stat.new(stat_params)
    end
=begin
    implement later
    
    def resetHighscore
        
    end
    def editHighscore
        
    end
=end
    private
    def stat_params
        params.require(:stat).permit(:score)
    end
end
