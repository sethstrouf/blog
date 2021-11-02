Rails.application.routes.draw do
  get 'contacts/new'
  post 'contacts/new', to: 'contacts#create'
  get 'contacts/thanks', to: 'contacts#thanks'
  devise_for :admins, path: '', path_names: { sign_in: 'admin' }
  get 'hello', to: 'static_pages#hello'
  get 'about', to: 'static_pages#about'
  get 'work', to: 'static_pages#work'
  root 'posts#index'
  resources :posts
  resources :comments, only: %i[create destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
