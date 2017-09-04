Rails.application.routes.draw do
  get 'phones/search'
  root to: 'phones#search'

  get 'phones', to: 'phones#search'

  resources :phones, except: :index do
    get 'delete'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
