Public::Engine.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    root 'home#index'

    get '/:locale', to: 'home#index'
    post '/locale/set', to: 'locale#set', as: :select_locale

    get '/about-us', to: 'home#about_us', as: :about_us
    get '/contact-us', to: 'home#contact_us', as: :contact_us
    resources :volunteers, only: %i[new create]
    resources :messages, only: :create
    resources :subscribers, only: :create

    get '/article/*id', to: 'articles#show', as: :article
    get '/p/*id', to: 'pages#show', as: :page
  end
end
