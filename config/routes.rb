Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :sellers, controllers: { sessions: 'sellers/sessions', registrations: 'sellers/registrations'}

  root "home#index"
end
