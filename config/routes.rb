Rails.application.routes.draw do
  resources :errors, only: [] do
    collection do
      get :raise_specific_error
    end
  end
end
