class StatsController < ApplicationController
    def index
        @stats=Stat.all
    end
    
    def create
        @stat = Stat.new(stat_params)
    end
    
    def show
        @stat=Stat.find(params[:id])
    end
    
    def edit
        @stat = Stat.find(params[:id])
    end
    
    def update
        @stat = Stat.find(params[:id])
        if @stat.update(stat_params)
            redirect_to @stat
        else
            render 'edit'
        end
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
        params.require(:stat).permit(:score, :name)
    end
    
end
