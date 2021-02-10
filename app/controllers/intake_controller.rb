class IntakeController < ApplicationController

    #create
    get '/intakes/new' do
        erb :'/intakes/new'
    end

    post '/intakes' do
        @intake = Intake.create(name: params[:name], amount: params[:amount])
        redirect "/intakes/#{@intake.id}"
    end

    #read

    get '/intakes/:id' do
        @intake = Intake.find(params[:id])
        erb :'/intakes/show'
    end

    get '/intakes' do
        @intakes = Intake.all #returns an array
        erb :'/intakes/index'
    end

    
end