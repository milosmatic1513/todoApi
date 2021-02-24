Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :todos do
    resources :items
  end
  #User Specific Functions
  delete :logout , to: "sessions#logout"
  get    :logged_in , to: "sessions#logged_in"
  post   :login ,to: "sessions#login"
  post   :signup,to: "registrations#create"
end
