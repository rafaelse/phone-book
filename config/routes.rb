Rails.application.routes.draw do
  get 'phones/search'
  root to: 'phones#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
