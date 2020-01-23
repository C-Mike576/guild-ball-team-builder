
class UsersController < ApplicationController

    get '/signup' do
        erb :"users/new"
    end

    post '/signup' do
        @user = User.new(:username => params[:username], :password => params[:password])
        if @user.save 
            session[:user_id] = @user.id
            redirect '/teams'
        else
            redirect '/'
        end
    
    end
end