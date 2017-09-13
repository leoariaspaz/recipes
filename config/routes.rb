Rails.application.routes.draw do
	get '/tasks/new_task', controller: :tasks, action: :new_task
  resources :tasks
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
