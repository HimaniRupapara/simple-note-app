Rails.application.routes.draw do
  resources :shared_notes
    resources :notes do
        resources :comments
      end
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }


  root to: 'home#home'
  get '/home/dashboard' => 'notes#index'
  get '/note/mark_as_important/:id' => 'notes#mark_as_important', as: :mark_as_important
  get '/note/search' => 'notes#searchNote'
end
