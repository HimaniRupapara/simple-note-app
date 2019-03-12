Rails.application.routes.draw do

  devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations:  'users/registrations'
      }
  resources :shared_notes do
      member do
          get :request_for_permission
          get 'update_permission/:permission_id'=> 'shared_notes#update_permission' ,as: :update_permission
        end
      end

  resources :users do
    resources :shared_notes
  end

  resources :notes do

      member do
        get :mark_as_important
      end
      resources :shared_notes
      resources :comments
  end




  root to: 'home#home'
  get '/home/dashboard' => 'notes#index'
  get '/note/search' => 'notes#searchNote'
  get '/user/shared_by_me_notes' => 'shared_notes#shared_by_me_notes' ,as: :shared_by_me_notes
end
