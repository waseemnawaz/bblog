Rails.application.routes.draw do
  devise_for :users
  get 'simple_pages/the_projects'
  #get 'simple_pages/index'
  get 'simple_pages/about'
  get 'simple_pages/contact'
	resources :users do
  	resources :projects
  end
  root 'simple_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
