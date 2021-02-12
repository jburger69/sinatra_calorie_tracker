class SessionController < ApplicationController

    get "/login" do
        erb :'/users/login'
    end
    
    post "/login" do
        user = User.find_by(:email => params[:email])
          
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/users/#{user.id}"
        else
            erb :'/users/failure'
        end
    end

    get '/logout' do
        session.clear
        erb :'/welcome'
    end

    helpers do
        def logged_in?
          !!session[:user_id]
        end
    
        def current_user
          User.find(session[:user_id])
        end
    end

end