Rails.application.routes.draw do

  get 'sessions/new'

  resources :games
  get 'welcome/index'
  resources :users do
    resources :stats
  end
  
  

  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
 # These routes will be for signup. The first renders a form in the browse, the second will 
    # receive the form and create a user in our database using the data given to us by the user.
   # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/back' => 'welcome#index'
  get '/breakout1' => 'games#breakout1'
  get '/breakout2' => 'games#breakout2'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  
  # Delete if it doesn't work
  post '/users/save_score' => 'users#save_score'

end
