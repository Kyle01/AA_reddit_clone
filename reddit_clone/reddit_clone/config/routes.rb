Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :subs do 
    post '/subscribe', to: 'subs#subscribe'
    resources :posts do
      resources :comments, only: [:new, :create, :show, :destroy]
    end
  end
end
