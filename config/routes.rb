Rails.application.routes.draw do
  
    root 'demo#index'
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
