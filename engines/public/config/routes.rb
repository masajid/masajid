Public::Engine.routes.draw do
  root 'home#index'

  get '/article/*id', to: 'articles#show', as: :article
  get '/p/*id', to: 'pages#show', as: :page
end
