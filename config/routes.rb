Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'posts#index'
    resources :posts, only: %i[show index]
    resources :tags, only: [:show]
    resources :categories, only: [:show]

    namespace :admin do
      resources :posts, except: %i[show index]
      resources :categories, except: [:show]
      resources :pictures, only: %i[create destroy]
    end
  end
end
