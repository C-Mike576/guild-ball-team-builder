
class UsersController < ApplicationController

    get '/signup' do
        erb :"users/new"
    end

    post '/signup' do
        if User.find_by(:username => params[:username])
            redirect '/?error=username taken'
        else
            @user = User.create(:username => params[:username], :password => params[:password])
            session[:user_id] = @user.id
            redirect '/teams'
        end
    end
end