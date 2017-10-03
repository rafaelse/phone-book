Rails.application.routes.draw do

  root to: 'search#index'

  get 'search', as: 'search', to: 'search#search'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get 'people/search'

  get 'divisions/search', to: 'divisions#root_search'
  get 'divisions/:id/search', to: 'divisions#children_search'

  resources :phones do
    get 'delete'
  end

  resources :users, except: :show do
    get 'delete', on: :member
  end
end
