Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  devise_for :users, :path_prefix => ''
  resources :users, only: [:show, :index] do
     member do
      post :follow
      post :unfollow
    end
  end
  root to: 'pages#home'
end
