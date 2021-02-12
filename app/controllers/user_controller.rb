class UserController < ApplicationController

    get '/users/signup' do
        erb :'/users/signup'
    end

    post '/users/signup' do
        @user = User.create(name: params[:name], email: params[:email], password: params[:password])
        redirect "/login"
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'/users/show'
    end

end