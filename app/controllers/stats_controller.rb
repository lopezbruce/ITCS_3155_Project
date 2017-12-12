class StatsController < ApplicationController
    def new
        @stat=Stat.new
    end
    
    #index
    def index
        @stats=Stat.all
    end
    
=begin
    def create
        @stat = Stat.new(stat_params)
        if @stat.save
            redirect_to @stat
        else
            render 'new'
        end
    end
=end

    def create
        @user = User.find(params[:user_id])
        @stat=@user.stats.create(stat_params)
        redirect_to user_path(@user)
    end
    def show
        @user=User.find(params[:user_id])
        @stat=@user.stats.find(params[:id])
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
        @user=User.find(params[:user_id])
        @stat = @user.stats.find(params[:id])
        @stat.destroy
        redirect_to :back
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
