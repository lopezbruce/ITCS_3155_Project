class UsersController < ApplicationController

# app/controllers/users_controller.rb

def new
  @user=User.new
end

def index
@user=User.all
end

def create
  @user = User.new(user_params)
  if @user.save
    log_in @user
    session[:user_id] = @user.id
    redirect_to '/'
  else
    render 'new'
  end
end

def show
  @user=User.find(params[:id])
end

def edit
  @user=User.find(params[:id])
end

def update
  @user=User.find(params[:id])
  if @user.update(user_params)
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

private

def user_params
  params.require(:user).permit(:username, :email, :password, :password_confirmation)
end

end