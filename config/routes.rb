Rails.application.routes.draw do

  root to: 'tests#index'

  devise_for :users,
             path: :gurus,
             path_names: { sign_in: :login, sign_out: :logout },
             controllers: { sessions: 'users/sessions' }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :badges, only: %i[index]

  get '/user_badges', to: 'badges#user_badges'

  # GET /test_passages/101/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :gists, only: :index

    resources :badges, except: :index
  end

  resources :feedbacks, only: %i[new create]
end
