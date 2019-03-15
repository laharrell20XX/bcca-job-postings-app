Rails.application.routes.draw do
  root 'job_postings#index'
  resources :employers do
    resources :job_postings, only: [:new, :create, :show, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
