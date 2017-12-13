class UsersController < ApplicationController

before_action :logged_in_user, only: [:edit, :update, :index]
before_action :correct_user, only: [:edit, :update]
before_action :authorize_admin, only: [:index, :edit]
# app/controllers/users_controller.rb




def new
  @user=User.new
end

#Save Score
def save_score
  new_score = params[:newScore]
  difficulty=params[:difficulty]
  t=DateTime.now
  dayOffset=1
  if (t.hour>=17)
    dayOffset=0
  end
  a=DateTime.new(t.year,t.month,t.day-dayOffset,t.hour+7,t.min)
  @stat=current_user.stats.create(:score => new_score, :name => difficulty, :date => a)

end
    
def index
@user=User.all
end

def create
  @user = User.new(user_params)
  if @user.save
    log_in @user
    session[:user_id] = @user.id
    redirect_to '/welcome/index'
  else
    render 'new'
  end
end

def show
  @user=User.find(params[:id])
  @user.stats.all.order(:score)
end

def edit
  @user=User.find(params[:id])
end

def update
  @user=User.find(params[:id])
  if @user.update_attributes(user_params)
    redirect_to '/'
  else
    render 'edit'
  end
end

def destroy
  @user=User.find(params[:id])
  @user.destroy
  redirect_to users_path
end

# Confirms a logged-in user.
def logged_in_user
  unless logged_in?
    flash[:danger] = "Please log in."
    redirect_to login_url
  end
end

def correct_user
  @user = User.find(params[:id])
  redirect_to(root_url) unless @user == current_user or admin?
end

def admin?
  current_user.username=="admin" or current_user.username=="BruceBruce" or current_user.username=="cbratti"
end

def authorize_admin
  redirect_to(root_url) unless admin?
end

def highscores
end

private

def user_params
  params.require(:user).permit(:username, :email, :password, :password_confirmation)
end

end