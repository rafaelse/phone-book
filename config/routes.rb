Rails.application.routes.draw do
  get 'phones/search'
  root to: 'phones#search'

  get 'phones', to: 'phones#search'
  get 'phones/update_depts', as: 'update_depts'
  get 'phones/update_sectors', as: 'update_sectors'

  resources :phones, except: :index do
    get 'delete'
  end

  resources :users, except: :show do
    get 'delete', on: :member
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
