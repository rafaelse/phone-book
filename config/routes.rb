Rails.application.routes.draw do

  root to: 'phones#search'
  get 'phones/search'
  get 'phones', to: 'phones#search'

  get 'phones/update_depts', as: 'update_depts'
  get 'phones/update_sectors', as: 'update_sectors'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :phones, except: :index do
    get 'delete'
  end

  resources :users, except: :show do
    get 'delete', on: :member
  end
end
