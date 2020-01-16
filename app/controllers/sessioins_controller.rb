class SessionsController < ApplicationController

    get '/login' do
        if !session[:user_id]
            erb :"sessions/login"
        else
            redirect '/teams'
        end
    end

    post '/login' do
        user = User.find_by(:username => params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/teams"
      else
        redirect "/login"
      end
    end


    get '/logout' do
        if session[:user_id] != nil
            session.clear
            redirect '/login'
        else
            redirect '/'
        end
    end
end