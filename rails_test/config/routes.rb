Rails.application.routes.draw do
  resources :users
  resources :fan_comments
  resources :reviews
  resources :authors
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'hello/index'
  get 'hello/list'
  # get 'books/:id/col_select'
  get 'view/col_select'
  get 'view/group_select'
  get 'view/dat_select'
  get 'view/col_radio'
  get 'view/fields'
  get 'view/simple_format'
  get 'view/truncate'
  get 'view/sanitize'
  get 'view/link'
  get 'view/url_for'
  get 'view/new'
  
  get 'login/index'
  
  get 'record/find'
  get 'record/find_by'
  get 'record/exist'
  get 'record/scope'
  get 'record/count'
  get 'record/update_all'
  get 'record/transact'
  get 'record/belongs'
  get 'record/has_and_belongs'
  
  
  get 'ctrl/upload'
  get 'ctrl/upload_process'
  post 'ctrl/upload_process'
  
  get 'login/index'
  get 'login/auth'
  post 'login/auth'
end
