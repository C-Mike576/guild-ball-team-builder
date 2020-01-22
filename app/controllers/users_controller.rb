
class UsersController < ApplicationController

    get '/signup' do
        erb :"users/new"
    end

    post '/signup' do
        if User.find_by(:username => params[:username])
            redirect '/'
        else
            @user = User.create(:username => params[:username], :password => params[:password])
            session[:user_id] = @user.id
            if @user.valid? 
                redirect '/teams'
            else
                redirect '/'
            end
        end
    end
end