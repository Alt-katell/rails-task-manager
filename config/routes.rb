Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #CREATE a new task
  get '/tasks/new', to: 'tasks#new', as: 'new_task'
  post '/tasks', to: 'tasks#create'

  # READ all tasks
  get '/tasks', to: 'tasks#index'
  # READ details of one task
  get '/tasks/:id', to: 'tasks#show', as: 'task'

  # UPDATE a task
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id', to: 'tasks#update'

  # DELETE a task
  delete '/tasks/:id', to: 'tasks#destroy'
end
