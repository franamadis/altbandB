Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flats do
    resources :bookings, only: [:new, :create, :edit, :update]
  end
  resources :bookings, only: [ :index, :show]
  get '/booking-requests', to: "dashboard#booking_requests"
end
