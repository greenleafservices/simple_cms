Rails.application.routes.draw do

  root :to => 'public#index'

  get 'show/:permalink', :to => 'public#show', :as => 'public_show'

  root 'demo#index'
# ****************  Match Routes ***********************
  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'
  # **************  Practice Match Routes ********************
  get 'demo/index'
  get 'march1/index2'
  get 'march1/index3'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/lynda'
  get 'demo/escape_output'

  # These match routes (defaults) were commented in lesson 07-03
  # and the resourceful routes below were added
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
  #get 'subjects/index'
  #get 'subjects/show'
  #get 'subjects/new'
  #get 'subjects/edit'
  #get 'subjects/delete'
#****************
  # get 'admin_users/index'
  # get 'admin_users/new'
  # get 'admin_users/edit'
  # get 'admin_users/delete'

# ********************  Resourceful Routes *****************


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

    resources :admin_users do
      member do
        get :delete
      end
    end




    # default route
    # may go away in future versions of Rails
    # get ':controller(/:action(/:id))'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
