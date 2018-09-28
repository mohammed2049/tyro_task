require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  resources :feedbacks, param: :number, only: %i[index show create] do
    collection do
      get :count
    end
  end
end
