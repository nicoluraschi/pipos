Rails.application.routes.draw do
  root 'pipos#new'

  resources :pipos, only: [:index, :new] do
    post :upload, on: :collection
  end
end
