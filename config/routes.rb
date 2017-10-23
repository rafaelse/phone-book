Rails.application.routes.draw do

  root to: 'index#index'

  controller :search do
    get 'search', as: 'search'
    get 'search/division/:id/divisions', to: 'search#subdivisions', as: 'search_subdivisions'
    get 'search/divisions/:id', to: 'search#divisions', as: 'search_divisions'
    get 'search/people/:id', to: 'search#people', as: 'search_people'
  end

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :people do
    get 'search', on: :collection
  end

  resources :divisions do
    get 'search', on: :collection, to: 'divisions#root_search'
    get 'search', on: :member, to: 'divisions#children_search'
  end

  resources :phones do
    get 'delete'
  end

  resources :users, except: :show do
    get 'delete', on: :member
  end
end
