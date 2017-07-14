Rails.application.routes.draw do
  root to: 'index#index'

  mount ActionCable.server => '/cable'

  namespace :admin do
    root to: 'index#index'
    resource :rate, only: [:update]
  end
end
