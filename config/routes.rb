Rails.application.routes.draw do
  # root url should go custom landing page
  root 'static_pages#landing'

  # routes associated with admin port
  scope :admin, as: 'admin' do

    # builds admin versions of these routes 
    get 'job_postings/new', to: 'job_postings#new_with_unknown_employer'
    post 'job_postings/create', to: 'job_postings#create_with_unknown_employer'

    resources :employers, shallow: true do
      resources :job_postings, except: [:index]  do

        # only need to create a comment for now
        resources :comments, only: [:new, :create]
      end
    end

    # index is be routed to 'admin/job_postings'
    resources :job_postings, only: [:index]
  end


  # routes associated with user port
  scope :user, as: 'user' do

    # builds user versions of these routes 
    get 'job_postings/new', to: 'job_postings#new_with_unknown_employer'
    post 'job_postings/create', to: 'job_postings#create_with_unknown_employer'

    resources :employers, shallow: true do
      resources :job_postings, except: [:index]  do

        # only need to create a comment for now
        resources :comments, only: [:new, :create]
      end
    end

    # index is routed to 'user/job_postings'
    resources :job_postings, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
