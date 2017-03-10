class DemoController < ApplicationController
    layout false

    def index #this is an action
        render('index') #the default action - does not need to be specified
        #render('hello') #sets the template for the index action to hello
    end

    def hello
        @array = [1,2,3,4,5]
        @id = params['id']
        @page = params[:page]
        render('hello') #the default action - does not need to be specified
        #render('index')  #sets the template for the hello action to index
    end

    def other_hello
        redirect_to(:action => 'hello')
    end

    def lynda
        redirect_to('http://lynda.com')
    end

    def escape_output
    end
end
