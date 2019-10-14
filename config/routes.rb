Rails.application.routes.draw do
  devise_for :users

  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'

  root 'home#index'
  post 'update_build', to: 'home#update_build'

  resources :carousels do
    resources :images
  end

  resources :timelines do
    resources :timeline_posts
  end
end
