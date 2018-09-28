require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  resources :feedbacks, only: %i[index create] do
    collection do
      get :count
      get '/:number', to: 'feedbacks#show_feedback'
    end
  end
end
