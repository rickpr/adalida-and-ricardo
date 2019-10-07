Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  post 'update_build', to: 'home#update_build'
  resources :carousels do
    resources :images
  end
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'
  resources :timelines do
    resources :timeline_posts do
      resources :images
    end
  end
end
