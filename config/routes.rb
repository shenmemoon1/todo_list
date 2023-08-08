Rails.application.routes.draw do
  root "articles#index"
  get '/articles/:id/info', to: 'articles#info', as: 'article_info'

  resources :articles do
    resources :comments
  end
end
