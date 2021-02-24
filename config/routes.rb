Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :todos do
    resources :items
  end
  resources :sessions ,only: [:create]
  resources :registrations ,only: [:create]
  delete :logout , to: "sessions#logout"
  get    :logged_in , to: "sessions#logged_in"
end
