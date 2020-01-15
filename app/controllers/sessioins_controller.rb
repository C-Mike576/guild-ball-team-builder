class SessionsController < ApplicationController

    get '/login' do
        if !session[:user_id]
            erb :"sessions/login"
        else
            redirect '/teams'
        end
    end

    post '/login' do
        user = login(params[:username], params[:password])
        if user
            redirect '/teams'
        else
            redirect '/signup'
        end
    end


    get '/logout' do
        logout!
    end
end