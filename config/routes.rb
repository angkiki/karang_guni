Rails.application.routes.draw do
  devise_for :buyers, controllers: { registrations: 'buyers/registrations', sessions: 'buyers/sessions' }
  root "home#index"
end
