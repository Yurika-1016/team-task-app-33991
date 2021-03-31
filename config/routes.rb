Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "welcome#index"
  resources :tasks, only:[:new, :create, :index, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
    collection do
      get 'search_created_at'
    end
    collection do
      get 'search_dead_line_date'
    end
  end
  resources :schedules, only:[:new, :create, :index, :edit, :update]
  resources :totals, only:[:new, :create, :edit, :update]
  resources :users,only:[:show]
  resources :comments, only:[:new, :create]
end
