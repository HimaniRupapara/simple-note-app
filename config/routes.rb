Rails.application.routes.draw do

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations:  'users/registrations'
      }
  resources :shared_notes

  resources :users do
    resources :shared_notes
  end

  resources :notes do
      resources :shared_notes
      resources :comments
  end




  root to: 'home#home'
  get '/home/dashboard' => 'notes#index'
  get '/note/mark_as_important/:id' => 'notes#mark_as_important', as: :mark_as_important
  get '/note/search' => 'notes#searchNote'
end
