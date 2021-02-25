class SessionController < ApplicationController

    get "/login" do
        erb :'/users/login'
    end
    
    post "/login" do
        user = User.find_by(:email => params[:email])
          
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/users/#{current_user.id}"
        else
            erb :'/users/failure'
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
            erb :'/welcome'
        else
            erb :'/welcome'
        end
    end

end