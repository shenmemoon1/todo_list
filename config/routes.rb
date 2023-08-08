Rails.application.routes.draw do
  root 'articles#index'

  resources :articles do
    resources :comments
  end
  get '/articles/:id/info', to: 'articles#info', as: 'article_info'
end
