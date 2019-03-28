Rails.application.routes.draw do
  root 'job_postings#index'
  get 'job_postings/new', to: 'job_postings#new_with_unknown_employer'
  post 'job_postings/create', to: 'job_postings#create_with_unknown_employer'
  resources :employers, shallow: true do
    resources :job_postings, except: [:index]  do
      resources :comments, only: [:new, :create]
    end
  end
  resources :job_postings, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
