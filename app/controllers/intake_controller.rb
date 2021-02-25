class IntakeController < ApplicationController

    #create
    get '/intakes/new' do
        if current_user = logged_in?
            erb :'/intakes/new'
        else
            erb :'/users/failure'
        end
    end

    post '/intakes' do
        current_user
        @intake = current_user.intakes.create(name: params[:name], amount: params[:amount], date: params[:date])
        if @intake.save
            redirect "/users/#{current_user.id}"
        else
            redirect '/intakes/new'
        end
    end

    #read

    get '/intakes/:id' do
        current_user
        @intake = Intake.find(params[:id])
        if @intake.save
            erb :'/intakes/show'
        else
            erb :'/intakes'
        end
    end

    get '/intakes' do
        if current_user = logged_in?
            @intakes = Intake.all #returns an array
            erb :'/intakes/index'
        else
            erb :'/users/failure'
        end
    end

    #update

    get '/intakes/:id/edit' do
        if logged_in?
            @intake = Intake.find(params[:id])
            erb :'/intakes/edit'
        else
            redirect '/home'
        end
    end

    patch '/intakes/:id' do
        current_user
        @intake = Intake.find(params[:id])
        if logged_in? && @intake.user_id == current_user.id
            @intake.update(name: params[:name], amount: params[:amount], date: params[:date])
            redirect "/users/#{current_user.id}"
        else
            erb :'/users/failure2'
        end
        # if logged_in? && @intake.id == current_user.id
        #     @intake.name = params[:name]
        #     @intake.amount = params[:amount]
        #     @intake.date = params[:date]
        #     @intake.save
        #     redirect "/intakes"
        # else
        #     redirect '/intakes'
        # end
    end

    #delete

    delete '/intakes/:id' do
        current_user
        @intake = Intake.find(params[:id])
        if logged_in? && @intake.user_id == current_user.id
            @intake.destroy
            redirect "/users/#{current_user.id}"
        else
            erb :'/users/failure2'
        end
    end

end