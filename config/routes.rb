Rails.application.routes.draw do
  resources :shared_notes


      resources :notes do
        resources :comments
      end
    


  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }


  root to: 'home#home'
  get '/home/dashboard' => 'home#dashboard'
end
