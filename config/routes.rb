# == Route Map
#
#                  Prefix Verb   URI Pattern                                   Controller#Action
#     new_manager_session GET    /managers/sign_in(.:format)                   managers/sessions#new
#         manager_session POST   /managers/sign_in(.:format)                   managers/sessions#create
# destroy_manager_session DELETE /managers/sign_out(.:format)                  managers/sessions#destroy
#        parties_managers GET    /managers/parties(.:format)                   managers#parties
#                managers GET    /managers(.:format)                           managers#index
#                         POST   /managers(.:format)                           managers#create
#             new_manager GET    /managers/new(.:format)                       managers#new
#            edit_manager GET    /managers/:id/edit(.:format)                  managers#edit
#                 manager GET    /managers/:id(.:format)                       managers#show
#                         PATCH  /managers/:id(.:format)                       managers#update
#                         PUT    /managers/:id(.:format)                       managers#update
#                         DELETE /managers/:id(.:format)                       managers#destroy
#      party_participants GET    /parties/:party_id/participants(.:format)     participants#index
#                         POST   /parties/:party_id/participants(.:format)     participants#create
#   new_party_participant GET    /parties/:party_id/participants/new(.:format) participants#new
#       party_participant GET    /parties/:party_id/participants/:id(.:format) participants#show
#                         PATCH  /parties/:party_id/participants/:id(.:format) participants#update
#                         PUT    /parties/:party_id/participants/:id(.:format) participants#update
#                 parties GET    /parties(.:format)                            parties#index
#                         POST   /parties(.:format)                            parties#create
#               new_party GET    /parties/new(.:format)                        parties#new
#              edit_party GET    /parties/:id/edit(.:format)                   parties#edit
#                   party GET    /parties/:id(.:format)                        parties#show
#                         PATCH  /parties/:id(.:format)                        parties#update
#                         PUT    /parties/:id(.:format)                        parties#update
#                         DELETE /parties/:id(.:format)                        parties#destroy
#               introduce GET    /introduce(.:format)                          home#introduce
#                   guide GET    /guide(.:format)                              home#guide
#                    root GET    /                                             home#index
#

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :managers, controllers: { sessions: 'managers/sessions' }

  resources :managers do
    collection do
      get 'parties'
    end
  end

  resources :parties do
    resources :participants, only: %i(index new create show update) do
    end
  end

  get 'introduce', to: 'home#introduce'
  get 'guide', to: 'home#guide'
  root to: 'home#index', as: :root
end
