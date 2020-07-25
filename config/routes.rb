Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  
  root "tops#index"

  resources :exhibitions, only: [:index] do
    collection do
      get :save_post
      get :tag_post
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
