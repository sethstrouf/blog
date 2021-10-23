Rails.application.routes.draw do
  devise_for :admins, :path => "",
    :path_names => {
      :sign_in => 'admin'
    }
  get 'hello',   to: 'static_pages#hello'
  get 'about',   to: 'static_pages#about'
  get 'work',    to: 'static_pages#work'
  get 'contact', to: 'static_pages#contact'
  root 'posts#index'
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
