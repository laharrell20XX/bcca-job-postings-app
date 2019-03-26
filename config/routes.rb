Rails.application.routes.draw do
  root 'job_postings#index'
  get 'job_postings/new', to: 'job_postings#new_with_unknown_employer'
  post 'job_postings/create', to: 'job_postings#create_with_unknown_employer'
  resources :employers do
    resources :job_postings, only: [:new, :create, :show, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
