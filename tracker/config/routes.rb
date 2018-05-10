Rails.application.routes.draw do

  get 'welcome/index'

   get '/activities/:activity_id/entries/new', to: 'entries#new'

  get '/activities/:activity_id/entries', to: 'entries#index'

  get '/entries/index', to: 'entries#index'

  get 'welcome/entries/index', to: 'entries#index'

  resources :activities do
    resources :entries
  end



  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
