Rails.application.routes.draw do
	devise_for :users, :controllers => { registrations: 'users/registrations' }

	root 'posts#index'

	post '/posts/index' => 'posts#create'

	resources :posts

	#namespace :admin do
	#	resources :post, except: [:show, :index]
	#end
end
