Rails.application.routes.draw do

  root to: 'search#index'

  get 'search', as: 'search', to: 'search#search'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :people do
    get 'phones', on: :member
    get 'search', on: :collection
  end

  resources :divisions do
    get 'search', on: :collection, to: 'divisions#root_search'
    get 'search', on: :member, to: 'divisions#children_search'
    get 'divisions', on: :member
    get 'phones', on: :member
  end

  resources :phones do
    get 'delete'
  end

  resources :users, except: :show do
    get 'delete', on: :member
  end
end
