Rails.application.routes.draw do
  root to: 'static_pages#root'

  get '/auth/:provider/callback' => 'sessions#create'
  resource :session, only: [:destroy]
end
