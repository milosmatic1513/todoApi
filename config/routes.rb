Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :todos do
    resources :items
  end
  resources :sessions ,only: [:create]
end
