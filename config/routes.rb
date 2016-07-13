Rails.application.routes.draw do
  
  # For details on the DSL available within this file, 
  #see http://guides.rubyonrails.org/routing.html

  namespace :ad do
  	devise_for :users, controllers: {
      sessions: 'ad/sessions'
    }
  	root 'pages#index'
  end
end
