Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  root 'posts#index'
  resources :users, only: %i[new create]
  resources :posts, only: %i[index new create show edit update destroy] do
    resources :comments, only: %i[create edit destroy], shallow: true
    collection do
      get :bookmarks
    end
  end
  resources :bookmarks, only: %i[create destroy]
  resource :profile, only: %i[show]
  resources :tags, only: [:show]
  resources :chats, only: [:index]
  resources :rooms do
    resources :messages, only: [:create]
  end

  get 'chat', to: 'rooms#chat_index', as: 'chat_index'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
