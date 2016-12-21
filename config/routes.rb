Rails.application.routes.draw do
  devise_for :users

	root 'media_contents#index'

	resources :media_contents, only: [:create]

	delete 'delete_media', to: 'media_contents#delete_media'
	delete 'delete_all', to: 'media_contents#delete_all'
end
