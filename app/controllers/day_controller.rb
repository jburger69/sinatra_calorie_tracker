class DayController < ApplicationController


    #create

    get '/days/new' do
        erb :'/days/new'
    end

    post '/days' do
        @day = Day.create(name: params[:name], date: params[:date])
        redirect "/days/#{@day.id}"
    end

    #read

    get '/days/:id' do
        @day = Day.find(params[:id])
        erb :'/days/show'
    end

    get '/days' do
        @days = Day.all #returns an array
        erb :'/days/index'
    end

    #update

    get '/days/:id/edit' do
        @day = Day.find(params[:id])
        erb :'/days/edit'
    end

    post '/days/:id' do
        @day = Day.find(params[:id])
        @day.update(name: params[:name], date: params[:date])
        redirect "/days/#{@day.id}"
    end

    #delete

    delete '/days/:id' do
        @day = Day.find(params[:id])
        @day.destroy
        redirect '/days'
    end


end