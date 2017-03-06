Rails.application.routes.draw do

# These match routes (defaults) were commented in lesson 07-03

  #get 'subjects/index'
  #get 'subjects/show'
  #get 'subjects/new'
  #get 'subjects/edit'
  #get 'subjects/delete'

    root 'demo#index'
    resources :subjects do # default
      member do
        get :delete #should be added ,no part of default resources
      end
    end

    get 'demo/index'
    get 'march1/index2'
    get 'march1/index3'
    get 'demo/hello'
    get 'demo/other_hello'
    get 'demo/lynda'



    # default route
    # may go away in future versions of Rails
    # get ':controller(/:action(/:id))'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
