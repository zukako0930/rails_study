Rails.application.routes.draw do
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'hello/index'
  get 'hello/list'
  # get 'books/:id/col_select'
  get 'view/col_select'
end
