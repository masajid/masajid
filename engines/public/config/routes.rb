Public::Engine.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    root 'home#index'

    get '/:locale', to: 'home#index'
    post '/locale/set', to: 'locale#set', as: :select_locale

    get '/about', to: 'home#about', as: :about
    get '/contact', to: 'home#contact', as: :contact
    resources :volunteers, only: %i[new create]
    resources :messages, only: :create
    resources :subscribers, only: :create

    get '/article/*id', to: 'articles#show', as: :article
    get '/p/*id', to: 'pages#show', as: :page

    match '*path' => 'errors#not_found', via: :all
  end
end
