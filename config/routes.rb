Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :sellers, controllers: { sessions: 'sellers/sessions', registrations: 'sellers/registrations'}
  devise_for :buyers, controllers: { registrations: 'buyers/registrations', sessions: 'buyers/sessions' }

  root "home#index"

  resources :requests, only: [:new, :create, :index, :show]

  # ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
  #        buyer_request
  # ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
  get '/buyer/request/:req_id', to: 'buyer_requests#new', as: 'new_buyer_request'
  post '/buyer/request/:req_id', to: 'buyer_requests#create', as: 'create_buyer_request'

 # ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
  #            buyer
  # ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
  get '/buyers/bids', to: 'buyers#bids', as: 'buyer_bids'

  # ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
  #            seller
  # ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
  get '/sellers/requests', to: 'sellers#request_index', as: 'request_index'
  get '/sellers/requests/:req_id/bids', to: 'sellers#request_bids', as: 'request_bids'
  get '/sellers/requests/:req_id/bids/:br_id', to: 'sellers#accept_bid', as: 'accept_bid'

  # ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
  #            messages
  # ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
  get '/buyer/new_message/:seller_id', to: 'messages#buyer_new', as:'new_buyer_message'
  get '/seller/new_message/:buyer_id', to: 'messages#seller_new', as:'new_seller_message'

  post '/messages', to: 'messages#create'

  get '/buyer/messages', to:'messages#buyer_show', as:'show_buyer_message'
  get '/seller/messages', to:'messages#seller_show', as:'show_seller_message'

  get '/buyers/wallets', to:'wallets#buyer_wallet', as: 'show_buyer_wallet'
  get '/seller/wallets', to:'wallets#seller_wallet', as: 'show_seller_wallet'

  get '/buyers/:id', to: 'buyers#index', as: 'buyer'
  get '/sellers/:id', to: 'sellers#index', as: 'seller'


  # display how much he has in his wallet
  # who the buyer is => will lead you to his wallet
  # current_buyer 

  # /buyer/:id
  # buyer_path(id: @buyer.id)

  # /banana/:apple/:pear
  # banana_path(apple: params_to_pass_in)

  # params[:apple] => this will give me what is after banana
  # if the route was /banana/yellow/green, then
  # params[:apple] => yellow
  # params[:pear] => green 

  # /fruit/:type (path name is called fruit_path)
  # for the apple link fruit_path(type: apple)
  # params[:type] => apple 

  # buyer_path(@buyer)
  # redirect_to @buyer


end
