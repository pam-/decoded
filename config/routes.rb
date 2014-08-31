Rails.application.routes.draw do
  devise_for :users

  resources :posts do 
  	resources :comments, except: [:index]
  end 

  get '/', to: 'posts#index'
  get '/about', to: 'static_pages#about'

  devise_scope :user do
    get '/sign_in', to: 'devise/sessions#new'
    delete '/sign_out', to: 'devise/sessions#destroy'
  end 
end
