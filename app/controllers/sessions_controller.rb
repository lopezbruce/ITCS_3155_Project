class SessionsController < ApplicationController
def new
  redirect_to(root_url) if logged_in?
end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to '/welcome/index'
      # Log the user in and redirect to the user's show page.
    else # Create an error message.
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
