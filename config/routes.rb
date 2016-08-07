Rails.application.routes.draw do
  
  # For details on the DSL available within this file, 
  #see http://guides.rubyonrails.org/routing.html

  namespace :ad do
  	root 'pages#index'

  	devise_for :users, controllers: {
      sessions: 'ad/sessions'
    }
    
    resources :academies

  end

end
