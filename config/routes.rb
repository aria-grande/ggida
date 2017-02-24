# == Route Map
#
#                  Prefix Verb   URI Pattern                  Controller#Action
#     new_manager_session GET    /managers/sign_in(.:format)  managers/sessions#new
#         manager_session POST   /managers/sign_in(.:format)  managers/sessions#create
# destroy_manager_session DELETE /managers/sign_out(.:format) managers/sessions#destroy
#                 parties GET    /parties(.:format)           parties#index
#                         POST   /parties(.:format)           parties#create
#               new_party GET    /parties/new(.:format)       parties#new
#              edit_party GET    /parties/:id/edit(.:format)  parties#edit
#                   party GET    /parties/:id(.:format)       parties#show
#                         PATCH  /parties/:id(.:format)       parties#update
#                         PUT    /parties/:id(.:format)       parties#update
#                         DELETE /parties/:id(.:format)       parties#destroy
#                    root GET    /                            home#index
#

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :managers, controllers: { sessions: 'managers/sessions' }

  resources :parties do
  end

  get 'introduce', to: 'home#introduce'
  get 'guide', to: 'home#guide'
  root to: 'home#index', as: :root
end
