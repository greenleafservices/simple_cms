Rails.application.routes.draw do

  #get 'sections/index'

  #get 'sections/show'

  #get 'sections/new'

  #get 'sections/edit'

  #get 'sections/delete'

  #get 'pages/index'

  #get 'pages/show'

  #get 'pages/new'

  #get 'pages/edit'

  #get 'pages/delete'

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

    resources :pages do #default
      member do
        get :delete # not added by default
      end
    end

    resources :sections do
      member do
        get :delete # not added by default
      end
    end

    get 'demo/index'
    get 'march1/index2'
    get 'march1/index3'
    get 'demo/hello'
    get 'demo/other_hello'
    get 'demo/lynda'
    get 'demo/escape_output'



    # default route
    # may go away in future versions of Rails
    # get ':controller(/:action(/:id))'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
