Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/questions/:id/delete', to: 'questions#destroy'

  resources :tests do
    resources  :questions, shallow: true
  end
end
