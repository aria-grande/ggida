# == Route Map
#
#                  Prefix Verb   URI Pattern                  Controller#Action
#     new_manager_session GET    /managers/sign_in(.:format)  managers/sessions#new
#         manager_session POST   /managers/sign_in(.:format)  managers/sessions#create
# destroy_manager_session DELETE /managers/sign_out(.:format) managers/sessions#destroy
#

Rails.application.routes.draw do
  devise_for :managers, controllers: { sessions: 'managers/sessions' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
