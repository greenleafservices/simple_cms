Rails.application.routes.draw do
  
    root 'march1#index2'
    get 'demo/index'
    get 'march1/index2'
    get 'march1/index3'
    
    # default route
    # may go away in future versions of Rails 
    # get ':controller(/:action(/:id))'
  
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
