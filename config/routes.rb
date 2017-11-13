Rails.application.routes.draw do
  get 'welcome/index'
  resources :stats
  
  get 'layouts/game' => 'welcome#game'

  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
 # These routes will be for signup. The first renders a form in the browse, the second will 
    # receive the form and create a user in our database using the data given to us by the user.
    get '/signup' => 'users#new'
    post '/users' => 'users#create'

end
