Landing::Engine.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    root 'home#index'

    get '/accounts/success-page', to: 'accounts#success_page', as: :success_page
    resources :accounts, only: %i[new create]
    resources :volunteers, only: %i[new create]

    devise_for(:users, {
      class_name: 'Content::User',
      controllers: {
        sessions: 'landing/user_sessions',
        passwords: 'landing/user_passwords',
        confirmations: 'landing/user_confirmations'
      },
      router_name: :landing
    })

    devise_scope :user do
      get '/login', to: 'user_sessions#new', as: :login
      post '/login', to: 'user_sessions#create', as: :create_new_session
      match '/logout', to: 'user_sessions#destroy', as: :logout, via: :delete
      get '/password/recover', to: 'user_passwords#new', as: :recover_password
      post '/password/recover', to: 'user_passwords#create', as: :reset_password
      get '/password/change', to: 'user_passwords#edit', as: :edit_password
      put '/password/change', to: 'user_passwords#update', as: :update_password
      get '/confirm', to: 'user_confirmations#new', as: :confirmation
      post '/confirm', to: 'user_confirmations#create', as: :resend_confirmation
    end

    get '/422', to: 'errors#unacceptable'
    get '/500', to: 'errors#internal_error'
    match '*path' => 'errors#not_found', via: :all
  end
end
