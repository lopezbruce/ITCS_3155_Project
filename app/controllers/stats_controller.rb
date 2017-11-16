class StatsController < ApplicationController
    def new
        @stat=Stat.new
    end
    
    def index
        @stats=Stat.all
    end

    def create
        @stat = Stat.new(stat_params)
        if @stat.save
            redirect_to @stat
        else
            render 'new'
        end
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
    
    def destroy
        @stat = Stat.find(params[:id])
        @stat.destroy
        redirect_to stats_path
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
