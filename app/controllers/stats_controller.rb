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
        @stat.update(:score => 5, :name => "hello")
    end
    
    def update
        @stat = Stat.find(params[:id])
        if @article.update(article_params)
            redirect_to @article
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
